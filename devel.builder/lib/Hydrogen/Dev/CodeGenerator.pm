use 5.012;
use strict;
use warnings;

use Mite::Signature::Compiler ();

package Hydrogen::Dev::CodeGenerator;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.006';

use parent 'Sub::HandlesVia::CodeGenerator';

sub class               { shift; };
sub _handle_shiftself   { shift; };
sub _handle_getter_code { shift; };
sub _function_for_croak { 'Hydrogen::croak'; };

sub _build_generator_for_type_assertion {
	my $self = shift;
	return sub {
		require B;
		my ( $gen, $env, $type, $varname ) = @_;
		if ( $gen->coerce and $type->{uniq} == Types::Standard::Bool()->{uniq} ) {
			return sprintf '%s = !!%s;', $varname, $varname;
		}
		if ( $gen->coerce and $type->has_coercion ) {
			return sprintf 'do { my $coerced = %s; %s or %s("Type check failed after coercion for %s: expected %%s, got value %%s", %s, $coerced); $coerced };',
				$type->coercion->inline_coercion( $varname ), $type->inline_check( '$coerced' ), $self->_function_for_croak, $gen->{_function_name}, B::perlstring( $type->display_name );
		}
		return sprintf 'do { %s or %s("Type check failed for %s: expected %%s, got value %%s", %s, %s); %s };',
			$type->inline_check( $varname ), $self->_function_for_croak, $gen->{_function_name}, B::perlstring( $type->display_name ), $varname, $varname;
	};
}

sub _handle_sigcheck {
	my ( $self, $method_name, $handler, $env, $code, $state ) = @_;

	# If there's a proper signature for the method...
	#
	if ( @{ $handler->signature || [] } ) {
		
		# Generate code using Type::Params to check the signature.
		# We also need to close over the signature.
		#
		my $compiler = 'Mite::Signature::Compiler'->new_from_compile(
			positional => {
				package        => $self->target,
				subname        => $method_name,
				is_wrapper     => !!0,
				mite_signature => $self,
			},
			$state->{shifted_self}
				? @{ $handler->signature }
				: ( $self->isa, @{ $handler->signature } ),
		);
		
		my $sigcode = $compiler->coderef->code;
		$sigcode =~ s/^\s+|\s+$//gs;
		if ( $sigcode =~ /return/ ) {
			push @$code, sprintf '$__signature ||= %s;', $sigcode;
			push @$code, '@_ = &$__signature;';
			$env->{'$__signature'} = \0;
		}
		else {
			$sigcode =~ s/^sub/do/;
			push @$code, sprintf '@_ = %s;', $sigcode;
		}
		
		# As we've now inserted a signature check, we can stop worrying
		# about signature checks.
		#
		$state->{signature_check_needed} = 0;
	}
	# There is no proper signature, but there's still check the
	# arity of the method.
	#
	else {
		# What is the arity?
		#
		my $min_args = $handler->min_args || 0;
		my $max_args = $handler->max_args;
		
		my $plus = 1;
		if ( $state->{shifted_self} ) {
			$plus = 0;
		}
		
		# What usage message do we want to print if wrong arity?
		#
		my $usg = sprintf(
			'%s("Wrong number of parameters for %s; usage: ".%s)',
			$self->_function_for_croak,
			$method_name,
			B::perlstring( $self->generate_usage_string( $method_name, $handler->usage ) ),
		);
		
		# Insert the check into the code.
		#
		if (defined $min_args and defined $max_args and $min_args==$max_args) {
			push @$code, sprintf('@_==%d or %s;', $min_args + $plus, $usg);
		}
		elsif (defined $min_args and defined $max_args) {
			push @$code, sprintf('(@_ >= %d and @_ <= %d) or %s;', $min_args + $plus, $max_args + $plus, $usg);
		}
		elsif (defined $min_args and $min_args > 0) {
			push @$code, sprintf('@_ >= %d or %s;', $min_args + $plus, $usg);
		}
		
		# We are still lacking a proper signature check though, so note
		# that in the state. The information can be used by
		# additional_validation coderefs.
		#
		$state->{signature_check_needed} = !!1;
	}
	
	return $self;
}

1;
