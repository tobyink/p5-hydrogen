use 5.012;
use strict;
use warnings;

use Hydrogen::Dev::CodeGenerator ();
use Hydrogen::Dev::Function ();
use List::Util ();
use Module::Runtime ();
use Path::Tiny ();
use Types::Standard ();

package Hydrogen::Dev::Type;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.002';

use Hydrogen::Dev::Mite -all;

param dev                     => ( isa => 'Hydrogen::Dev', weak_ref => true );
param type_name               => ( isa => 'Str' );
param is_prototyped           => ( isa => 'Bool', default => false );

field code_for_default        => ( builder => true );
field lctype                  => ( builder => true );
field example_var             => ( builder => true );
field target_module           => ( builder => true );
field curry_module            => ( builder => true );
field target_filename         => ( builder => true );
field curry_filename          => ( builder => true );
field test_filename           => ( builder => true );
field curry_test_filename     => ( builder => true );
field handler_library         => ( builder => true );
field function_names          => ( builder => true );
field functions               => ( builder => true );
field codegen                 => ( builder => true );
field type_constraint         => ( builder => true );
field sandboxing_package      => ( builder => true );
field type_desc_for_abstract  => ( builder => true );
field type_desc_for_functions => ( builder => true );

sub _build_code_for_default {
	my $self = shift;

	return {
		Array   => '[]',
		Bool    => '!!0',
		Code    => 'sub {}',
		Counter => '0',
		Hash    => '{}',
		Number  => '0',
		String  => 'q{}',
	}->{ $self->type_name } // 'undef';
}

sub _build_lctype {
	return lc( shift->type_name );
}

sub _build_example_var {
	my $self = shift;

	my $example_var = '$' . $self->lctype;
	if ( $self->is_prototyped ) {
		$example_var = {
			Array => '@array',
			Code  => '{ CODE }',
			Hash  => '%hash',
		}->{$self->type_name} // $example_var;
	}

	return $example_var;
}

sub _build_target_module {
	my $self = shift;

	my $target_module = sprintf '%s::%s',
		$self->dev->target_namespace, $self->type_name;

	if ( not $self->is_prototyped ) {
		for my $rtn ( $self->dev->_reference_type_names ) {
			next if $rtn ne $self->type_name;
			$target_module .= 'Ref';
			last;
		}
	}

	return $target_module;
}

sub _build_curry_module {
	my $self = shift;

	my $target_module = sprintf '%s::Curry::%s',
		$self->dev->target_namespace, $self->type_name;

	if ( not $self->is_prototyped ) {
		for my $rtn ( $self->dev->_reference_type_names ) {
			next if $rtn ne $self->type_name;
			$target_module .= 'Ref';
			last;
		}
	}

	return $target_module;
}

sub _build_target_filename {
	my $self = shift;

	return Path::Tiny::path(
		$self->dev->target_directory,
		Module::Runtime::module_notional_filename( $self->target_module ),
	);
}

sub _build_curry_filename {
	my $self = shift;

	return Path::Tiny::path(
		$self->dev->target_directory,
		Module::Runtime::module_notional_filename( $self->curry_module ),
	);
}

sub _build_test_filename {
	my $self = shift;

	my $testfile = lc( $self->target_module );
	$testfile =~ s{::}{-}g;
	$testfile .= '.t';

	return Path::Tiny::path( $self->dev->test_directory, $testfile );
}

sub _build_curry_test_filename {
	my $self = shift;

	my $testfile = lc( $self->curry_module );
	$testfile =~ s{::}{-}g;
	$testfile .= '.t';

	return Path::Tiny::path( $self->dev->test_directory, $testfile );
}

sub _build_handler_library {
	my $self = shift;

	return Module::Runtime::use_module(
		'Sub::HandlesVia::HandlerLibrary::' . $self->type_name
	);
}

sub _build_function_names {
	my $self = shift;

	my $lib = $self->handler_library;
	my @funcs = do { no strict 'refs'; sort @{"$lib\::METHODS"} };

	# These make no sense to provide
	if ( $self->type_name eq 'Code' ) {
		@funcs = grep $_ ne 'execute_method', @funcs;
	}
	elsif ( $self->type_name eq 'Scalar' ) {
		@funcs = grep $_ ne 'scalar_reference', @funcs;
	}

	return [ List::Util::uniq(@funcs) ];
}

sub _make_function {
	shift;
	return 'Hydrogen::Dev::Function'->new( @_ );
}

sub _build_functions {
	my $self = shift;

	my @funcs = map {
		$self->_make_function(
			function_name => $_,
			type          => $self,
		);
	} @{ $self->function_names };

	return \@funcs;
}

sub _build_type_constraint {
	my $self = shift;

	return {
		Hash    => Types::Standard::HashRef,
		Array   => Types::Standard::ArrayRef,
		Code    => Types::Standard::CodeRef,
		String  => Types::Standard::Str,
		Number  => Types::Standard::Num,
		Counter => Types::Standard::Int,
	}->{ $self->type_name } // Types::Standard::Any;
}

sub _build_type_desc_for_abstract {
	my $self = shift;

	my $prototyped = $self->is_prototyped;

	return {
		Array   => $prototyped ? 'arrays' : 'arrayrefs',
		Bool    => 'booleans',
		Code    => $prototyped ? 'code blocks' : 'coderefs',
		Counter => 'integer counters',
		Hash    => $prototyped ? 'hashes' : 'hashrefs',
	}->{ $self->type_name } // ( $self->lctype . 's' );
}

sub _build_type_desc_for_functions {
	my $self = shift;

	my $prototyped = $self->is_prototyped;

	return {
		Array   => $prototyped ? 'an array' : 'a reference to an array',
		Bool    => 'a scalar which will be treated as a boolean',
		Code    => $prototyped ? 'a code block' : 'a reference to a sub',
		Counter => 'an integer',
		Hash    => $prototyped ? 'a hash' : 'a reference to a hash',
		Number  => 'a numeric scalar',
		String  => 'a string scalar',
	}->{ $self->type_name } // ( 'a ' . $self->lctype );
}

sub _build_sandboxing_package {
	shift->target_module . '::__SANDBOX__';
}

sub _build_codegen {
	my $self = shift;

	my $type             = $self->type_name;
	my $target_module    = $self->target_module;
	my $prototyped       = $self->is_prototyped;
	my $example_var      = $self->example_var;
	my $code_for_default = $self->code_for_default;

	my $setter = sub { my ($gen, $value) = @_; "( \${ \$__REF__ } = $value )" };
	if ( $type eq 'Array' ) {
		$setter = sub {
			my ($gen, $value) = @_;
			if ( $value eq '[]' ) {
				return "( \@{ \$_[0] } = () )";
			}
			"( \@{ \$_[0] } = \@{ + $value } )";
		};
	}
	elsif ( $type eq 'Hash' ) {
		$setter = sub {
			my ($gen, $value) = @_;
			if ( $value eq '{}' ) {
				return "( \%{ \$_[0] } = () )";
			}
			"( %{ \$_[0] } = %{ + $value } )";
		};
	}

	return 'Hydrogen::Dev::CodeGenerator'->new(
		toolkit        => $self->dev->target_namespace,
		target         => $target_module,
		attribute      => 'dummy',
		attribute_spec => {},
		isa            => $self->type_constraint,
		coerce         => !!0,
		env            => {},
		sandboxing_package => $self->sandboxing_package,
		generator_for_self => sub { my ($gen) = @_;  '$__REF__' },
		generator_for_slot => sub { my ($gen) = @_; '$$__REF__' },
		generator_for_get  => sub { my ($gen) = @_; '$$__REF__' },
		generator_for_set  => $setter,
		generator_for_usage_string => sub {
			my ( $gen, $method_name, $guts ) = @_;
			if ( $prototyped and $type eq 'Code' ) {
				if ( length $guts ) {
					return "$target_module\::$method_name $example_var $guts";
				}
				else {
					return "$target_module\::$method_name $example_var";
				}
			}
			else {
				if ( length $guts ) {
					return "$target_module\::$method_name( $example_var, $guts )";
				}
				else {
					return "$target_module\::$method_name( $example_var )";
				}
			}
		},
		generator_for_default => sub { $code_for_default },
	);
}

sub write_module {
	my $self = shift;

	my $file = $self->target_filename;
	$file->parent->mkpath;
	$file->spew( $self->compile_module );

	return $self;
}

sub compile_module {
	my $self = shift;

	local $Type::Tiny::AvoidCallbacks = 1;
	local $Type::Tiny::SafePackage = "package @{[ $self->sandboxing_package ]};";

	return join q{} => (
		$self->_compile_module_header,
		$self->_compile_module_functions,
		$self->_compile_module_footer,
	);
}

sub _compile_module_header {
	my $self = shift;

	my $code = '';

	# Pragmata
	$code .= "# This file was autogenerated.\n";
	$code .= "use 5.008008;\n";
	$code .= "use strict;\n";
	$code .= "use warnings;\n";
	$code .= "no warnings qw( void once );\n";
	$code .= "use @{[ $self->dev->target_namespace ]} ();\n";
	$code .= "\n";
	
	# Package meta
	$code .= "package @{[ $self->target_module ]};\n";
	$code .= "\n";
	$code .= "our \$AUTHORITY = 'cpan:@{[ uc $self->dev->author_cpanid ]}';\n";
	$code .= "our \$VERSION   = '@{[ $self->dev->target_version ]}';\n";
	$code .= "\n";
	
	# Pod intro
	$code .= "=head1 NAME\n";
	$code .= "\n";
	$code .= "@{[ $self->target_module ]} - a standard library for @{[ $self->type_desc_for_abstract ]}\n";
	$code .= "\n";
	$code .= "=cut\n";
	$code .= "\n";

	# Begin functions list in pod
	$code .= "=head1 FUNCTIONS\n";
	$code .= "\n";
	$code .= "Each function expects @{[ $self->type_desc_for_functions ]} as its first argument.\n";
	$code .= "\n";
	if ( $self->is_prototyped ) {
		$code .= "The functions use prototypes, so you don't have to pass a reference.\n";
		$code .= "\n";
	}
	$code .= "=cut\n";
	$code .= "\n";

	# Exporter::Shiny
	$code .= "use Exporter::Shiny qw(\n";
	$code .= "    $_\n" for @{ $self->function_names };
	$code .= ");\n";
	$code .= "\n";

	return $code;
}

sub _compile_module_functions {
	my $self = shift;

	my $code = '';
	for my $f ( @{ $self->functions } ) {
		$code .= $f->compile_pod;
		$code .= $f->compile_code;
	}

	return $code;
}

sub _compile_module_footer {
	my $self = shift;

	my @funcs = @{ $self->function_names };
	my $egfunc = $funcs[2] // $funcs[0];

	return <<"FOOTER";
1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use @{[ $self->target_module ]} -all;

To import a particular function, use:

    use @{[ $self->target_module ]} '$egfunc';

To rename functions:

    use @{[ $self->target_module ]} '$egfunc' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

@{[ $self->dev->compile_bug_section ]}
=head1 SEE ALSO

L<@{[ $self->dev->target_namespace ]}>,
L<@{[ $self->curry_module ]}>,
L<@{[ $self->handler_library ]}>.

@{[ $self->dev->compile_author_section ]}
FOOTER
}

sub write_curry_module {
	my $self = shift;

	my $file = $self->curry_filename;
	$file->parent->mkpath;
	$file->spew( $self->compile_curry_module );

	return $self;
}

sub compile_curry_module {
	my $self = shift;

	local $Type::Tiny::AvoidCallbacks = 1;
	local $Type::Tiny::SafePackage = "package @{[ $self->sandboxing_package ]};";

	return join q{} => (
		$self->_compile_curry_module_header,
		$self->_compile_curry_module_functions,
		$self->_compile_curry_module_footer,
	);
}

sub _compile_curry_module_header {
	my $self = shift;

	my $code = '';

	# Pragmata
	$code .= "# This file was autogenerated.\n";
	$code .= "use 5.008008;\n";
	$code .= "use strict;\n";
	$code .= "use warnings;\n";
	$code .= "no warnings qw( void once );\n";
	$code .= "use @{[ $self->dev->target_namespace ]} ();\n";
	$code .= "use @{[ $self->target_module ]} ();\n";
	$code .= "\n";
	
	# Package meta
	$code .= "package @{[ $self->curry_module ]};\n";
	$code .= "\n";
	$code .= "our \$AUTHORITY = 'cpan:@{[ uc $self->dev->author_cpanid ]}';\n";
	$code .= "our \$VERSION   = '@{[ $self->dev->target_version ]}';\n";
	$code .= "\n";
	
	# Pod intro
	$code .= "=head1 NAME\n";
	$code .= "\n";
	$code .= "@{[ $self->curry_module ]} - easily curry functions from @{[ $self->target_module ]}\n";
	$code .= "\n";
	$code .= "=cut\n";
	$code .= "\n";

	# Begin functions list in pod
	$code .= "=head1 FUNCTIONS\n";
	$code .= "\n";
	$code .= "Each function expects @{[ $self->type_desc_for_functions ]} as its only argument and returns a coderef.\n";
	$code .= "\n";
	$code .= "=cut\n";
	$code .= "\n";

	# Exporter::Shiny
	$code .= "use Exporter::Shiny qw(\n";
	$code .= "    curry_$_\n" for @{ $self->function_names };
	$code .= ");\n";
	$code .= "\n";

	return $code;
}

sub _compile_curry_module_functions {
	my $self = shift;

	my $code = '';
	for my $f ( @{ $self->functions } ) {
		$code .= $f->compile_curry_pod;
		$code .= $f->compile_curry_code;
	}

	return $code;
}

sub _compile_curry_module_footer {
	my $self = shift;

	my @funcs = @{ $self->function_names };
	my $egfunc = 'curry_' . ( $funcs[2] // $funcs[0] );

	return <<"FOOTER";
1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use @{[ $self->curry_module ]} -all;

To import a particular function, use:

    use @{[ $self->curry_module ]} '$egfunc';

To rename functions:

    use @{[ $self->curry_module ]} '$egfunc' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

@{[ $self->dev->compile_bug_section ]}
=head1 SEE ALSO

L<@{[ $self->dev->target_namespace ]}>,
L<@{[ $self->target_module ]}>,
L<@{[ $self->handler_library ]}>.

@{[ $self->dev->compile_author_section ]}
FOOTER
}

sub write_test {
	my $self = shift;

	my $file = $self->test_filename;
	$file->parent->mkpath;
	$file->spew( $self->compile_test );

	return $self;
}

sub compile_test {
	my $self = shift;

	return join q{} => (
		$self->_compile_test_header,
		$self->_compile_test_functions,
		$self->_compile_test_footer,
	);
}

sub _compile_test_header {
	my $self = shift;

	return <<"HEADER";
# This file was autogenerated.
use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use @{[ $self->target_module ]};

isa_ok( '@{[ $self->target_module ]}', 'Exporter::Tiny' );

my %EXPORTS = map +( \$_ => 1 ), \@@{[ $self->target_module ]}::EXPORT_OK;

HEADER
}

sub _compile_test_functions {
	my $self = shift;

	my $code = '';
	for my $f ( @{ $self->functions } ) {
		$code .= $f->compile_test;
	}

	return $code;
}

sub _compile_test_footer {
	my $self = shift;

	return <<"FOOTER";
# :)
done_testing;
FOOTER
}

sub write_curry_test {
	my $self = shift;

	my $file = $self->curry_test_filename;
	$file->parent->mkpath;
	$file->spew( $self->compile_curry_test );

	return $self;
}

sub compile_curry_test {
	my $self = shift;

	return join q{} => (
		$self->_compile_curry_test_header,
		$self->_compile_curry_test_functions,
		$self->_compile_curry_test_footer,
	);
}

sub _compile_curry_test_header {
	my $self = shift;

	return <<"HEADER";
# This file was autogenerated.
use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use @{[ $self->curry_module ]};

isa_ok( '@{[ $self->curry_module ]}', 'Exporter::Tiny' );

my %EXPORTS = map +( \$_ => 1 ), \@@{[ $self->curry_module ]}::EXPORT_OK;

HEADER
}

sub _compile_curry_test_functions {
	my $self = shift;

	my $code = '';
	for my $f ( @{ $self->functions } ) {
		$code .= $f->compile_curry_test;
	}

	return $code;
}

sub _compile_curry_test_footer {
	my $self = shift;

	return <<"FOOTER";
# :)
done_testing;
FOOTER
}

1;