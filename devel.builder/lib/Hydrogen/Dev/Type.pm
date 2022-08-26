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
our $VERSION   = '0.010';

use Hydrogen::Dev::Mite -all;

param dev                     => ( isa => 'Hydrogen::Dev', weak_ref => true );
param type_name               => ( isa => 'Str' );
param is_prototyped           => ( isa => 'Bool', default => false );

field code_for_default        => ( builder => true );
field lctype                  => ( builder => true );
field example_var             => ( builder => true );
field target_module           => ( builder => sub { $_[0]->__build_module_name( undef, not $_[0]->is_prototyped ) } );
field curry_module            => ( builder => sub { $_[0]->__build_module_name( 'Curry', true ) } );
field topic_module            => ( builder => sub { $_[0]->__build_module_name( 'Topic', true ) } );
field target_filename         => ( builder => sub { $_[0]->__build_module_filename( 'target_module' ) } );
field curry_filename          => ( builder => sub { $_[0]->__build_module_filename( 'curry_module' ) } );
field topic_filename          => ( builder => sub { $_[0]->__build_module_filename( 'topic_module' ) } );
field test_filename           => ( builder => sub { $_[0]->__build_unittest_filename( 'target_module' ) } );
field curry_test_filename     => ( builder => sub { $_[0]->__build_unittest_filename( 'curry_module' ) } );
field topic_test_filename     => ( builder => sub { $_[0]->__build_unittest_filename( 'topic_module' ) } );
field handler_library         => ( builder => true );
field function_names          => ( builder => true );
field functions               => ( builder => true );
field codegen                 => ( builder => true );
field topic_codegen           => ( builder => true );
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
		}->{ $self->type_name } // $example_var;
	}
	elsif ( $self->type_name =~ /^(Array|Code|Hash)$/ ) {
		$example_var .= 'ref';
	}

	return $example_var;
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
		toolkit                    => $self,
		target                     => $target_module,
		attribute                  => 'dummy',
		attribute_spec             => {},
		isa                        => $self->type_constraint,
		set_checks_isa             => $self->type_constraint == Types::Standard::Any,
		coerce                     => false,
		env                        => {},
		sandboxing_package         => $self->sandboxing_package,
		generator_for_self         => sub {  '$__REF__' },
		generator_for_slot         => sub { '$$__REF__' },
		generator_for_get          => sub { '$$__REF__' },
		generator_for_set          => $setter,
		generator_for_default      => sub { $code_for_default },
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
	);
}

sub _build_topic_codegen {
	my $self = shift;

	my $type             = $self->type_name;
	my $target_module    = $self->topic_module;
	my $prototyped       = $self->is_prototyped;
	my $code_for_default = $self->code_for_default;

	my $setter = sub { my ($gen, $value) = @_; "( \$_ = $value )" };
	if ( $type eq 'Array' ) {
		$setter = sub {
			my ($gen, $value) = @_;
			if ( $value eq '[]' ) {
				return "( \@{ \$_ } = () )";
			}
			"( \@{ \$_ } = \@{ + $value } )";
		};
	}
	elsif ( $type eq 'Hash' ) {
		$setter = sub {
			my ($gen, $value) = @_;
			if ( $value eq '{}' ) {
				return "( \%{ \$_ } = () )";
			}
			"( %{ \$_ } = %{ + $value } )";
		};
	}

	return 'Hydrogen::Dev::CodeGenerator'->new(
		toolkit                    => $self,
		target                     => $target_module,
		attribute                  => 'dummy',
		attribute_spec             => { is_topic => true },
		isa                        => $self->type_constraint,
		set_checks_isa             => $self->type_constraint == Types::Standard::Any,
		coerce                     => false,
		env                        => {},
		sandboxing_package         => $self->sandboxing_package,
		generator_for_self         => sub { '$_' },
		generator_for_slot         => sub { '$_' },
		generator_for_get          => sub { '$_' },
		generator_for_set          => $setter,
		generator_for_args         => sub { '@_' },
		generator_for_arg          => sub { my $n = pop() - 1; "\$_[$n]" },
		generator_for_argc         => sub { '(0+@_)' },
		generator_for_default      => sub { $code_for_default },
		generator_for_usage_string => sub {
			my ( $gen, $method_name, $guts ) = @_;
			if ( length $guts ) {
				return "$target_module\::$method_name( $guts )";
			}
			else {
				return "$target_module\::$method_name()";
			}
		},
	);
}

sub write_module {
	my $self = shift;
	$self->__write( $self->target_filename, $self->compile_module );
}

sub compile_module {
	my $self = shift;
	$self->__compile( sub { (
		$self->__compile_module_header(
			module    => $self->target_module,
			abstract  => "a standard library for @{[ $self->type_desc_for_abstract ]}",
			function_documentation => sub {
				$_ .= "Each function expects @{[ $self->type_desc_for_functions ]} as its first argument.\n";
				$_ .= "\n";
				if ( $self->is_prototyped ) {
					$_ .= "The functions use prototypes, so you don't have to pass a reference.\n";
					$_ .= "\n";
				}
			},
		),
		$self->__compile_functions( [ 'compile_pod', 'compile_code' ] ),
		$self->__compile_module_footer(
			module    => $self->target_module,
		),
	) } );
}

sub write_curry_module {
	my $self = shift;
	$self->__write( $self->curry_filename, $self->compile_curry_module );
}

sub compile_curry_module {
	my $self = shift;
	$self->__compile( sub { (
		$self->__compile_module_header(
			module    => $self->curry_module,
			abstract  => "easily curry functions from @{[ $self->target_module ]}",
			additional_imports => sub {
				$_ .= "use @{[ $self->target_module ]} ();\n";
			},
			function_documentation => sub {
				$_ .= "Each function expects @{[ $self->type_desc_for_functions ]} as its only argument and returns a coderef.\n";
				$_ .= "\n";
			},
			function_name_prefix => 'curry_',
		),
		$self->__compile_functions( [ 'compile_curry_pod', 'compile_curry_code' ] ),
		$self->__compile_module_footer(
			module    => $self->curry_module,
			function_name_prefix => 'curry_',
		),
	) } );
}

sub write_topic_module {
	my $self = shift;
	$self->__write( $self->topic_filename, $self->compile_topic_module );
}

sub compile_topic_module {
	my $self = shift;
	$self->__compile( sub { (
		$self->__compile_module_header(
			module    => $self->topic_module,
			abstract  => "functions from @{[ $self->target_module ]} applied to C<\$_>",
			function_documentation => sub {
				$_ .= "Each function implicitly operates on C<< \$_ >>, expecting it to be @{[ $self->type_desc_for_functions ]}.\n";
				$_ .= "\n";
			},
		),
		$self->__compile_functions( [ 'compile_topic_pod', 'compile_topic_code' ] ),
		$self->__compile_module_footer(
			module    => $self->topic_module,
		),
	) } );
}

sub write_test {
	my $self = shift;
	$self->__write( $self->test_filename, $self->compile_test );
}

sub compile_test {
	my $self = shift;
	$self->__compile( sub { (
		$self->__compile_unittest_header(
			filename => $self->test_filename,
			module   => $self->target_module,
		),
		$self->__compile_functions( [ 'compile_test' ] ),
		$self->__compile_unittest_footer,
	) } );
}

sub write_curry_test {
	my $self = shift;
	$self->__write( $self->curry_test_filename, $self->compile_curry_test );
}

sub compile_curry_test {
	my $self = shift;
	$self->__compile( sub { (
		$self->__compile_unittest_header(
			filename => $self->curry_test_filename,
			module   => $self->curry_module,
		),
		$self->__compile_functions( [ 'compile_curry_test' ] ),
		$self->__compile_unittest_footer,
	) } );
}

sub write_topic_test {
	my $self = shift;
	$self->__write( $self->topic_test_filename, $self->compile_topic_test );
}

sub compile_topic_test {
	my $self = shift;
	$self->__compile( sub { (
		$self->__compile_unittest_header(
			filename => $self->topic_test_filename,
			module   => $self->topic_module,
		),
		$self->__compile_functions( [ 'compile_topic_test' ] ),
		$self->__compile_unittest_footer,
	) } );
}

sub __build_module_name {
	my ( $self, $middle_part, $append_ref ) = ( shift, @_ );

	my $ns = $self->dev->target_namespace;
	my $ref = '';
	if ( $append_ref ) {
		for my $rtn ( $self->dev->_reference_type_names ) {
			next if $rtn ne $self->type_name;
			$ref = 'Ref';
			last;
		}
	}

	return sprintf(
		'%s::%s%s',
		$middle_part ? "$ns\::$middle_part" : $ns,
		$self->type_name,
		$ref,
	);
}

sub __build_module_filename {
	my ( $self, $attribute ) = ( shift, @_ );
	return Path::Tiny::path(
		$self->dev->target_directory,
		Module::Runtime::module_notional_filename( $self->$attribute ),
	);
}

sub __build_unittest_filename {
	my ( $self, $attribute ) = ( shift, @_ );

	my $testfile = lc( $self->$attribute );
	$testfile =~ s{::}{-}g;
	$testfile .= '.t';

	return Path::Tiny::path( $self->dev->test_directory, $testfile );
}

sub __write {
	my ( $self, $file, $contents ) = ( shift, @_ );

	$file->parent->mkpath;
	$file->spew( $contents );

	return $self;
}

sub __compile {
	my ( $self, $callback ) = ( shift, @_ );
	local $Type::Tiny::AvoidCallbacks = 1;
	local $Type::Tiny::SafePackage = "package @{[ $self->sandboxing_package ]};";
	return join q{}, $callback->( $self );
}

sub __compile_module_header {
	my ( $self, %arg ) = ( shift, @_ );

	local $_ = '';

	# Pragmata
	$_ .= "# This file was autogenerated.\n";
	$_ .= "use 5.008001;\n";
	$_ .= "use strict;\n";
	$_ .= "use warnings;\n";
	$_ .= "no warnings qw( void once );\n";
	$_ .= "use @{[ $self->dev->target_namespace ]} ();\n";
	( $arg{additional_imports} // sub {} )->( $self );
	$_ .= "\n";
	
	# Package meta
	$_ .= "package @{[ $arg{module} ]};\n";
	$_ .= "\n";
	$_ .= "our \$AUTHORITY = 'cpan:@{[ uc $self->dev->author_cpanid ]}';\n";
	$_ .= "our \$VERSION   = '@{[ $self->dev->target_version ]}';\n";
	$_ .= "\n";
	
	# Pod intro
	$_ .= "=head1 NAME\n";
	$_ .= "\n";
	$_ .= "@{[ $arg{module} ]} - @{[ $arg{abstract} ]}\n";
	$_ .= "\n";
	$_ .= "=head1 VERSION\n";
	$_ .= "\n";
	$_ .= "This documentation is for @{[ $arg{module} ]} @{[ $self->dev->target_version ]}.\n";
	$_ .= "\n";
	$_ .= "=cut\n";
	$_ .= "\n";

	# Begin functions list in pod
	$_ .= "=head1 FUNCTIONS\n";
	$_ .= "\n";
	( $arg{function_documentation} // sub {} )->( $self );
	$_ .= "=cut\n";
	$_ .= "\n";

	# Exporter::Shiny
	$_ .= "use Exporter::Shiny qw(\n";
	for my $f ( @{ $self->function_names } ) {
		$_ .= "    @{[ $arg{function_name_prefix} // '' ]}$f\n" ;
	}
	$_ .= ");\n";
	$_ .= "\n";

	return $_;
}

sub __compile_unittest_header {
	my ( $self, %arg ) = ( shift, @_ );

	return <<"HEADER";
# This file was autogenerated.

=head1 NAME

@{[ Path::Tiny::path( $arg{filename} )->basename ]} - unit tests for @{[ $arg{module} ]}

@{[ $self->dev->compile_author_section ]}
=cut

use 5.008001;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use @{[ $arg{module} ]};

isa_ok( '@{[ $arg{module} ]}', 'Exporter::Tiny' );

my %EXPORTS = map +( \$_ => 1 ), \@@{[ $arg{module} ]}::EXPORT_OK;

HEADER
}

sub __compile_functions {
	my ( $self, $methods ) = ( shift, @_ );

	my $code = '';
	for my $f ( @{ $self->functions } ) {
		for my $m ( @$methods ) {
			$code .= $f->$m;
		}
	}

	return $code;
}

sub __compile_module_footer {
	my ( $self, %arg ) = ( shift, @_ );

	my @funcs = @{ $self->function_names };
	my $egfunc = ( $arg{function_name_prefix} // '' ) . ( $funcs[2] // $funcs[0] );

	my @see_also = ( $self->dev->target_namespace );
	push @see_also, $self->target_module unless $arg{module} eq $self->target_module;
	if ( $arg{module} =~ /::(\w+)Ref$/ ) {
		my $type = $1;
		push @see_also, sprintf '%s::%s', $self->dev->target_namespace, $type;
	}
	push @see_also, $self->curry_module unless $arg{module} eq $self->curry_module;
	push @see_also, $self->topic_module unless $arg{module} eq $self->topic_module;
	push @see_also, $self->handler_library;
	if ( $self->type_name eq 'Array' ) {
		push @see_also, qw( List::Util List::MoreUtils );
	}
	if ( $self->type_name eq 'Hash' ) {
		push @see_also, qw( Hash::Util );
	}
	if ( $self->type_name eq 'Code' ) {
		push @see_also, qw( Sub::Util );
	}

	local $_ = "1;\n\n";
	
	$_ .= "=head1 EXPORT\n";
	$_ .= "\n";
	$_ .= "No functions are exported by this module by default. To import them all (this is usually a bad idea), use:\n";
	$_ .= "\n";
	$_ .= "    use @{[ $arg{module} ]} -all;\n";
	$_ .= "\n";
	$_ .= "To import a particular function, use:\n";
	$_ .= "\n";
	$_ .= "    use @{[ $arg{module} ]} '$egfunc';\n";
	$_ .= "\n";
	$_ .= "To rename functions:\n";
	$_ .= "\n";
	$_ .= "    use @{[ $arg{module} ]} '$egfunc' => { -as => 'myfunc' };\n";
	$_ .= "\n";
	$_ .= "See L<Exporter::Tiny::Manual::Importing> for more hints on importing.\n";
	$_ .= "\n";

	$_ .= $self->dev->compile_bug_section . "\n";
	
	$_ .= "=head1 SEE ALSO\n";
	$_ .= "\n";
	$_ .= join( qq{,\n}, map "L<$_>", @see_also ) . ".\n";
	$_ .= "\n";
	
	$_ .= $self->dev->compile_author_section . "\n";

	return $_;
}

sub __compile_unittest_footer {
	my $self = shift;

	return <<"FOOTER";
done_testing; # :)
FOOTER
}

1;