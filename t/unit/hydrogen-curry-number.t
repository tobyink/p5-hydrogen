# This file was autogenerated.

=head1 NAME

hydrogen-curry-number.t - unit tests for Hydrogen::Curry::Number

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2022 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DISCLAIMER OF WARRANTIES

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

=cut

use 5.008001;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Curry::Number;

isa_ok( 'Hydrogen::Curry::Number', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Curry::Number::EXPORT_OK;

subtest 'curry_abs' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_abs), 'function exists';
    ok $EXPORTS{'curry_abs'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_abs( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_abs';
};

subtest 'curry_add' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_add), 'function exists';
    ok $EXPORTS{'curry_add'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_add( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_add';
};

subtest 'curry_cmp' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_cmp), 'function exists';
    ok $EXPORTS{'curry_cmp'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_cmp( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_cmp';
};

subtest 'curry_div' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_div), 'function exists';
    ok $EXPORTS{'curry_div'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_div( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_div';
};

subtest 'curry_eq' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_eq), 'function exists';
    ok $EXPORTS{'curry_eq'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_eq( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_eq';
};

subtest 'curry_ge' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_ge), 'function exists';
    ok $EXPORTS{'curry_ge'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_ge( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_ge';
};

subtest 'curry_get' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_get), 'function exists';
    ok $EXPORTS{'curry_get'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_get( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_get';
};

subtest 'curry_gt' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_gt), 'function exists';
    ok $EXPORTS{'curry_gt'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_gt( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_gt';
};

subtest 'curry_le' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_le), 'function exists';
    ok $EXPORTS{'curry_le'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_le( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_le';
};

subtest 'curry_lt' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_lt), 'function exists';
    ok $EXPORTS{'curry_lt'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_lt( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_lt';
};

subtest 'curry_mod' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_mod), 'function exists';
    ok $EXPORTS{'curry_mod'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_mod( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_mod';
};

subtest 'curry_mul' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_mul), 'function exists';
    ok $EXPORTS{'curry_mul'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_mul( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_mul';
};

subtest 'curry_ne' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_ne), 'function exists';
    ok $EXPORTS{'curry_ne'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_ne( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_ne';
};

subtest 'curry_set' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_set), 'function exists';
    ok $EXPORTS{'curry_set'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_set( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_set';
};

subtest 'curry_sub' => sub {
    ok exists(&Hydrogen::Curry::Number::curry_sub), 'function exists';
    ok $EXPORTS{'curry_sub'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Number::curry_sub( 0 );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_sub';
};

done_testing; # :)
