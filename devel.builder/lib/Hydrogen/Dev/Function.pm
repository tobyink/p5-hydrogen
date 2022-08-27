use 5.012;
use strict;
use warnings;

use Sub::HandlesVia::Handler ();

package Hydrogen::Dev::Function;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.015';

use Hydrogen::Dev::Mite -all;

param function_name           => ( isa => 'Str' );
param type                    => ( isa => 'Hydrogen::Dev::Type', weak_ref => true, handles => [ 'dev', 'type_name' ] );

field handler                 => ( builder => true );

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
			$pod .= sprintf "=head2 C<< %s %s %s >>\n\n",
				$self->function_name, $self->type->example_var, $h->usage;
		}
		elsif ( $h->args == 0 ) {
			$pod .= sprintf "=head2 C<< %s %s >>\n\n",
				$self->function_name, $self->type->example_var;
		}
		else {
			$pod .= sprintf "=head2 C<< %s >>\n\n",
				$self->function_name;
		}
	}
	else {
		if ( $h->usage ) {
			$pod .= sprintf "=head2 C<< %s( %s, %s ) >>\n\n",
				$self->function_name, $self->type->example_var, $h->usage;
		}
		elsif ( $h->args == 0 ) {
			$pod .= sprintf "=head2 C<< %s( %s ) >>\n\n",
				$self->function_name, $self->type->example_var;
		}
		else {
			$pod .= sprintf "=head2 C<< %s >>\n\n",
				$self->function_name;
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
		}->{ $self->type_name } // '';
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
	$self->type->codegen->{_function_name} = $func;
	my $eval = $self->type->codegen->_generate_ec_args_for_handler( $func, $h );
	delete $self->type->codegen->{_function_name};

	my $make_ref = 'my $__REF__ = \\$_[0];';

	my $code = join "\n", @{ $eval->{source} };
	$code =~ s/sub\s*\{/sub $func$proto {$make_ref/xs;
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

	$code =~ s/CORE::fc/Hydrogen::fc/g;

	return $code . "\n";
}

sub compile_curry_pod {
	my $self = shift;

	my $pod = '';
	$pod .= sprintf "=head2 C<< curry_%s( %s ) >>\n\n",
		$self->function_name, $self->type->example_var;
	$pod .= sprintf "Curry the first argument of C<< %s::%s >>.\n\n",
		$self->type->target_module, $self->function_name;
	$pod .= "=cut\n\n";

	return $pod;
}

sub compile_curry_code {
	my $self = shift;

	my $mod   = $self->type->target_module;
	my $func  = $self->function_name;
	my $check = $self->type->type_constraint->inline_check( '$_[0]' );
	my $name  = $self->type->type_constraint->display_name;

	return sprintf <<'CODE', $func, $func, $check, $func, $name, $mod, $func;
sub curry_%s {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_%s: got %%d, %%s",
            scalar(@_), "expected exactly 1 parameter"
        );
    %s
        or Hydrogen::croak(
            "Type check failed in signature for curry_%s: %%s should be %%s",
            "\\$_[0]", "%s"
        );
    my $ref = \$_[0];
    return sub { %s::%s( $$ref, @_ ) };
}

CODE
}

sub compile_topic_pod {
	my $self = shift;

	my $h = $self->handler;
	my $pod = '';

	if ( $h->usage ) {
		$pod .= sprintf "=head2 C<< %s( %s ) >>\n\n",
			$self->function_name, $h->usage;
	}
	elsif ( $h->args == 0 ) {
		$pod .= sprintf "=head2 C<< %s() >>\n\n",
			$self->function_name;
	}
	else {
		$pod .= sprintf "=head2 C<< %s >>\n\n",
			$self->function_name;
	}

	$pod .= "Operates on C<< \$_ >>, which must be @{[ $self->type->type_desc_for_functions ]}.\n\n";

	if ( $h->signature and @{ $h->signature } ) {
		$pod .= sprintf "Arguments: %s.\n\n",
			join q[, ], map sprintf( 'B<< %s >>', $_->display_name ), @{ $h->signature };
	}

	if ( $h->documentation ) {
		my $docs = $h->documentation;
		my $example_var = '$_';
		$docs =~ s/\$object->attr/$example_var/g;
		$docs =~ s/Chainable method/Function/;
		$docs =~ s/attribute/original value/;
		$pod .= $docs . "\n\n";
	}

	$pod .= "=cut\n\n";

	return $pod;
}

sub compile_topic_code {
	my $self = shift;

	my $h = $self->handler;

	my $func = $self->function_name;
	$self->type->topic_codegen->{_function_name} = $func;
	my $eval = $self->type->topic_codegen->_generate_ec_args_for_handler( $func, $h );
	delete $self->type->topic_codegen->{_function_name};

	my $code = join "\n", @{ $eval->{source} };
	$code =~ s/sub\s*\{/sub $func {/xs;
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

	$code =~ s/CORE::fc/Hydrogen::fc/g;

	return $code . "\n";
}

sub compile_test {
	my $self = shift;

	my $func = $self->function_name;
	my $t = '';

	$t .= sprintf "subtest '%s' => sub {\n",
		$func;
	$t .= sprintf "    ok exists(&%s::%s), 'function exists';\n",
		$self->type->target_module, $func;
	$t .= sprintf "    ok \$EXPORTS{'%s'}, 'function is importable';\n",
		$func;

	my $h = $self->handler;
	if ( $h->_examples and not $self->type->example_var =~ /^\{/ ) {
		my @lines = split /\n/, $h->_examples->(
			'My::Class',
			"attribute",
			join( '::', $self->type->target_module, $func ),
		);
		$t .= "    my \$exception = dies {\n";
		$t .= '      ' . $self->_munge_line( $_ ) . "\n" for @lines;
		$t .= "    };\n";
		$t .= "    is \$exception, undef, 'no exception thrown running $func example';\n";
	}

	$t .= "};\n\n";

	return $t;
}

sub compile_curry_test {
	my $self = shift;

	my $func = 'curry_' . $self->function_name;
	my $t = '';

	$t .= sprintf "subtest '%s' => sub {\n",
		$func;
	$t .= sprintf "    ok exists(&%s::%s), 'function exists';\n",
		$self->type->curry_module, $func;
	$t .= sprintf "    ok \$EXPORTS{'%s'}, 'function is importable';\n",
		$func;
	$t .= "    my \$exception = dies {\n";
	$t .= sprintf "        my \$curried = %s::%s( %s );\n",
		$self->type->curry_module, $func, $self->type->code_for_default;
	$t .= "        is ref( \$curried ), 'CODE', 'function returns a coderef';\n";
	$t .= "    };\n";
	$t .= "    is \$exception, undef, 'no exception thrown running $func';\n";
	$t .= "};\n\n";

	return $t;
}

sub compile_topic_test {
	my $self = shift;

	my $func = $self->function_name;
	my $t = '';

	$t .= sprintf "subtest '%s' => sub {\n",
		$func;
	$t .= sprintf "    ok exists(&%s::%s), 'function exists';\n",
		$self->type->topic_module, $func;
	$t .= sprintf "    ok \$EXPORTS{'%s'}, 'function is importable';\n",
		$func;

	my $h = $self->handler;
	if ( $h->_examples and not $self->type->example_var =~ /^\{/ ) {
		my @lines = split /\n/, $h->_examples->(
			'My::Class',
			"attribute",
			join( '::', $self->type->topic_module, $func ),
		);
		$t .= "    my \$exception = dies {\n";
		$t .= "        local \$_;\n";
		$t .= '      ' . $self->_munge_line_topic( $_ ) . "\n" for @lines;
		$t .= "    };\n";
		$t .= "    is \$exception, undef, 'no exception thrown running $func example';\n";
	}

	$t .= "};\n\n";

	return $t;
}

sub __trim {
	my $arg = shift;
	$arg =~ s/^\s*//g;
	$arg =~ s/\s*$//g;
	return $arg;
}

sub _munge_line {
	my ( $self, $line ) = @_;

	my $func = $self->function_name;
	my $egvar = $self->type->example_var;
	substr( $egvar, 1, 0 ) = 'test';
	my $default = $self->type->code_for_default;

	if ( $egvar =~ /^\@/ ) {
		$line =~ s/my \$object(\d*)\s*=\s*My::Class->new\( attribute => (.+) \)/my $egvar$1 = \@{ + $2 }/;
		$line =~ s/my \$object(\d*)\s*=\s*My::Class->new\(\)/my $egvar$1 = \@{ + $default }/;
		$line =~ s/\$object(\d*)->attribute/$egvar$1/g;
		$line =~ s/\$object(\d*)->_set_attribute\(\s*(.+)\s*\)/$egvar$1 = \@{ + $2 }/g;
	}
	elsif ( $egvar =~ /^\%/ ) {
		$line =~ s/my \$object(\d*)\s*=\s*My::Class->new\( attribute => (.+) \)/my $egvar$1 = \%{ + $2 }/;
		$line =~ s/my \$object(\d*)\s*=\s*My::Class->new\(\)/my $egvar$1 = \%{ + $default }/;
		$line =~ s/\$object(\d*)->attribute/$egvar$1/g;
		$line =~ s/\$object(\d*)->_set_attribute\(\s*(.+)\s*\)/$egvar$1 = \%{ + $2 }/g;
	}
	else {
		$line =~ s/my \$object(\d*)\s*=\s*My::Class->new\( attribute => (.+) \)/my $egvar$1 = $2/;
		$line =~ s/my \$object(\d*)\s*=\s*My::Class->new\(\)/my $egvar$1 = $default/;
		$line =~ s/\$object(\d*)->attribute/$egvar$1/g;
		$line =~ s/\$object(\d*)->_set_attribute\(\s*(.+)\s*\)/$egvar$1 = $2/g;
	}

	my $qqn = quotemeta( $self->type->target_module . "::$func" );
	$line =~ s/\$object(\d*)->($qqn)\(\s*\)/$2( $egvar$1 )/;
	$line =~ s/\$object(\d*)->($qqn)\(/$2( $egvar$1,/;
	$line =~ s/\$object(\d*)->($qqn)/$2( $egvar$1 )/;

	if ( $line =~ /^(\s*)say Dumper\((.*)\)\s*;\s*#(.*)# ==>(.*)$/ ) {
		my ( $space, $expr, $pfx, $expected ) = ( $1, __trim("$2"), $3, __trim("$4") );
		my $esc = '';
		if ( $expr =~ /^[@%]/ ) {
			$esc = '\\';
		}
		$line = "${space}${pfx}is( ${esc}${expr}, $expected, q{$expr deep match} );";
	}
	elsif ( $line =~ /^(\s*)say(.*);\s*#(.*)# ==>(.*)$/ ) {
		my ( $space, $expr, $pfx, $expected ) = ( $1, __trim("$2"), $3, __trim("$4") );
		if ( $expected eq 'true' ) {
			$line = "${space}${pfx}ok( $expr, q{$expr is true} );";
		}
		elsif ( $expected eq 'false' ) {
			$line = "${space}${pfx}ok( !($expr), q{$expr is false} );";
		}
		else {
			$line = "${space}${pfx}is( $expr, $expected, q{$expr is $expected} );";
		}
	}

	if ( $line =~ /\$scalar = 11 ;/ ) {
		$line = '  $scalar = 11;';
	}

	$line =~ s/ [%] (\w+) -> [{] (.+?) [}] /\$$1\{$2\}/xg;

	$line =~ s/\bsay\b/note/;
	return $line;
}

sub _munge_line_topic {
	my ( $self, $line ) = @_;

	my $func = $self->function_name;
	my $egvar = '$_';
	my $default = $self->type->code_for_default;

	$line =~ s/my \$object(\d*)\s*=\s*My::Class->new\( attribute => (.+) \)/$egvar = $2/;
	$line =~ s/my \$object(\d*)\s*=\s*My::Class->new\(\)/$egvar = $default/;
	$line =~ s/\$object(\d*)->attribute/$egvar/g;
	$line =~ s/\$object(\d*)->_set_attribute\(\s*(.+)\s*\)/$egvar = $2/g;

	my $qqn = quotemeta( $self->type->topic_module . "::$func" );
	$line =~ s/\$object(\d*)->($qqn)\(\s*\)/$2()/;
	$line =~ s/\$object(\d*)->($qqn)\(/$2(/;
	$line =~ s/\$object(\d*)->($qqn)/$2()/;

	if ( $line =~ /^(\s*)say Dumper\((.*)\)\s*;\s*#(.*)# ==>(.*)$/ ) {
		my ( $space, $expr, $pfx, $expected ) = ( $1, __trim("$2"), $3, __trim("$4") );
		my $esc = '';
		if ( $expr =~ /^[@%]/ ) {
			$esc = '\\';
		}
		$line = "${space}${pfx}is( ${esc}${expr}, $expected, q{$expr deep match} );";
	}
	elsif ( $line =~ /^(\s*)say(.*);\s*#(.*)# ==>(.*)$/ ) {
		my ( $space, $expr, $pfx, $expected ) = ( $1, __trim("$2"), $3, __trim("$4") );
		if ( $expected eq 'true' ) {
			$line = "${space}${pfx}ok( $expr, q{$expr is true} );";
		}
		elsif ( $expected eq 'false' ) {
			$line = "${space}${pfx}ok( !($expr), q{$expr is false} );";
		}
		else {
			$line = "${space}${pfx}is( $expr, $expected, q{$expr is $expected} );";
		}
	}

	$line =~ s/\bsay\b/note/;
	return $line;
}

1;
