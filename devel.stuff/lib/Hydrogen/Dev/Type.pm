use 5.012;
use strict;
use warnings;

use Hydrogen::Dev::CodeGenerator ();
use Hydrogen::Dev::Function ();
use Module::Runtime ();
use Path::Tiny ();
use Types::Standard ();

package Hydrogen::Dev::Type;

use Moo;

has dev              => ( is => 'ro', required => !!1, weak_ref => !!1 );
has type_name        => ( is => 'ro', required => !!1 );
has is_prototyped    => ( is => 'ro', default => !!0 );

has code_for_default => ( init_arg => undef, is => 'lazy' );
has lctype           => ( init_arg => undef, is => 'lazy' );
has example_var      => ( init_arg => undef, is => 'lazy' );
has target_module    => ( init_arg => undef, is => 'lazy' );
has target_filename  => ( init_arg => undef, is => 'lazy' );
has handler_library  => ( init_arg => undef, is => 'lazy' );
has function_names   => ( init_arg => undef, is => 'lazy' );
has functions        => ( init_arg => undef, is => 'lazy' );
has codegen          => ( init_arg => undef, is => 'lazy' );
has type_constraint  => ( init_arg => undef, is => 'lazy' );
has type_desc_for_abstract  => ( init_arg => undef, is => 'lazy' );
has type_desc_for_functions => ( init_arg => undef, is => 'lazy' );

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

sub _build_target_filename {
	my $self = shift;

	return Path::Tiny::path(
		$self->dev->target_directory,
		Module::Runtime::module_notional_filename( $self->target_module ),
	);
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

	return \@funcs;
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

sub _build_codegen {
	my $self = shift;

	my $type             = $self->type_name;
	my $target_module    = $self->target_module;
	my $prototyped       = $self->is_prototyped;
	my $example_var      = $self->example_var;
	my $code_for_default = $self->code_for_default;

	my $setter = sub { my ($gen, $value) = @_; "( \$_[0] = $value )" };
	if ( $type eq 'Array' ) {
		$setter = sub {
			my ($gen, $value) = @_;
			if ( $value eq '[]' ) {
				return "( \@{ \$_[0] } = () )";
			}
			"( \@{ \$_[0] } = \@{ $value } )";
		};
	}
	elsif ( $type eq 'Hash' ) {
		$setter = sub {
			my ($gen, $value) = @_;
			if ( $value eq '{}' ) {
				return "( \%{ \$_[0] } = () )";
			}
			"( %{ \$_[0] } = %{ $value } )";
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
		sandboxing_package => undef,
		generator_for_slot => sub { my ($gen) = @_; '$_[0]'               },
		generator_for_get  => sub { my ($gen) = @_; '$_[0]'               },
		generator_for_set  => $setter,
		generator_for_self => sub { my ($gen) = @_; '( my $__SELF__ = $_[0] )' },
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
	local $Type::Tiny::SafePackage = "package @{[ $self->target_module ]}::__SANDBOX__;";

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
	$code .= "use @{[ $self->dev->target_namespace ]} ();\n";
	$code .= "\n";
	
	# Package meta
	$code .= "package @{[ $self->target_module ]};\n";
	$code .= "\n";
	# XXX: don't hard code these!
	$code .= "our \$AUTHORITY = 'cpan:TOBYINK';\n";
	$code .= "our \$VERSION   = '0.001';\n";
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

L<@{[ $self->dev->target_namespace ]}>, L<@{[ $self->handler_library ]}>.

@{[ $self->dev->compile_author_section ]}
FOOTER
}

1;