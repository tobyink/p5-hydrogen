use 5.012;
use strict;
use warnings;

use Sub::HandlesVia::Handler ();

package Hydrogen::Dev::Function;

use Moo;

has function_name    => ( is => 'ro', required => !!1 );
has type             => ( is => 'ro', required => !!1, weak_ref => !!1, handles => [ 'dev', 'type_name' ] );

has handler          => ( is => 'lazy', init_arg => undef );

sub _build_handler {
	my $self = shift;

	return 'Sub::HandlesVia::Handler'->lookup( $self->function_name, $self->type_name );
}

sub compile_pod {
	my $self = shift;

	my $h = $self->handler;
	my $pod = '';

	if ( $self->type->is_prototyped and $self->type_name eq 'Code' ) {
		if ( $h->usage ) {
			$pod .= sprintf "=head2 C<< %s::%s %s %s >>\n\n",
				$self->type->target_module, $self->function_name, $self->type->example_var, $h->usage;
		}
		elsif ( $h->args == 0 ) {
			$pod .= sprintf "=head2 C<< %s::%s %s >>\n\n",
				$self->type->target_module, $self->function_name, $self->type->example_var;
		}
		else {
			$pod .= sprintf "=head2 C<< %s::%s >>\n\n",
				$self->type->target_module, $self->function_name;
		}
	}
	else {
		if ( $h->usage ) {
			$pod .= sprintf "=head2 C<< %s::%s( %s, %s ) >>\n\n",
				$self->type->target_module, $self->function_name, $self->type->example_var, $h->usage;
		}
		elsif ( $h->args == 0 ) {
			$pod .= sprintf "=head2 C<< %s::%s( %s ) >>\n\n",
				$self->type->target_module, $self->function_name, $self->type->example_var;
		}
		else {
			$pod .= sprintf "=head2 C<< %s::%s >>\n\n",
				$self->type->target_module, $self->function_name;
		}
	}

	if ( $h->signature and @{ $h->signature } ) {
		$pod .= sprintf "Additional arguments: %s.\n\n",
			join q[, ], map sprintf( 'B<< %s >>', $_->display_name ), @{ $h->signature };
	}

	if ( $h->documentation ) {
		my $docs = $h->documentation;
		my $example_var = $self->type->example_var;
		$docs =~ s/\$object->attr/$example_var/g;
		$docs =~ s/Chainable method/Function/;
		$docs =~ s/attribute/original value/;
		$pod .= $docs . "\n\n";
	}

	$pod .= "=cut\n\n";

	return $pod;
}


sub compile_code {
	my $self = shift;

	my $h = $self->handler;

	my $proto = '';
	if ( $self->type->is_prototyped and defined $h->max_args and $h->max_args == 0 ) {
		$proto = {
			Array => ' (\@)',
			Code  => ' (&)',
			Hash  => ' (\%)',
		}->{ $self->type_name} // '';
	}
	elsif ( $self->type->is_prototyped ) {
		my ( $required, $optional ) = ( '', ';@' );
		if ( defined $h->min_args ) {
			$required = '$' x $h->min_args;
			$optional = defined( $h->max_args ) ? ( '$' x ( $h->max_args - $h->min_args ) ) : '@';
			$optional = ";$optional" if $optional;
		}
		$proto = {
			Array => ' (\@' . $required . $optional . ')',
			Code  => ' (&' . $required . $optional . ')',
			Hash  => ' (\%' . $required . $optional . ')',
		}->{ $self->type_name };
	}

	my $func = $self->function_name;
	my $eval = $self->type->codegen->_generate_ec_args_for_handler( $func, $h );

	my $code = join "\n", @{ $eval->{source} };
	$code =~ s/sub/sub $func$proto/xs;
	if ( $eval->{environment}{'$__signature'} ) {
		$code = "{ my \$__signature; $code }";
		delete $eval->{environment}{'$__signature'};
	}

	if ( keys %{ $eval->{environment} } ) {
		require Data::Dumper;
		warn Data::Dumper::Dumper($eval);
		die "ARGH!";
	}

	if (eval { require Perl::Tidy }) {
		my $tidy = '';
		Perl::Tidy::perltidy(
			source      => \$code,
			destination => \$tidy,
		);
		$code = $tidy;
	}

	return $code . "\n";
}

1;
