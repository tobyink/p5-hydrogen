# This file was autogenerated.
use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Curry::String;

isa_ok( 'Hydrogen::Curry::String', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Curry::String::EXPORT_OK;

subtest 'curry_append' => sub {
    ok exists(&Hydrogen::Curry::String::curry_append), 'function exists';
    ok $EXPORTS{'curry_append'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_append( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_append' );
};

subtest 'curry_chomp' => sub {
    ok exists(&Hydrogen::Curry::String::curry_chomp), 'function exists';
    ok $EXPORTS{'curry_chomp'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_chomp( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_chomp' );
};

subtest 'curry_chop' => sub {
    ok exists(&Hydrogen::Curry::String::curry_chop), 'function exists';
    ok $EXPORTS{'curry_chop'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_chop( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_chop' );
};

subtest 'curry_clear' => sub {
    ok exists(&Hydrogen::Curry::String::curry_clear), 'function exists';
    ok $EXPORTS{'curry_clear'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_clear( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_clear' );
};

subtest 'curry_cmp' => sub {
    ok exists(&Hydrogen::Curry::String::curry_cmp), 'function exists';
    ok $EXPORTS{'curry_cmp'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_cmp( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_cmp' );
};

subtest 'curry_cmpi' => sub {
    ok exists(&Hydrogen::Curry::String::curry_cmpi), 'function exists';
    ok $EXPORTS{'curry_cmpi'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_cmpi( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_cmpi' );
};

subtest 'curry_contains' => sub {
    ok exists(&Hydrogen::Curry::String::curry_contains), 'function exists';
    ok $EXPORTS{'curry_contains'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_contains( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_contains' );
};

subtest 'curry_contains_i' => sub {
    ok exists(&Hydrogen::Curry::String::curry_contains_i), 'function exists';
    ok $EXPORTS{'curry_contains_i'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_contains_i( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_contains_i' );
};

subtest 'curry_ends_with' => sub {
    ok exists(&Hydrogen::Curry::String::curry_ends_with), 'function exists';
    ok $EXPORTS{'curry_ends_with'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_ends_with( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_ends_with' );
};

subtest 'curry_ends_with_i' => sub {
    ok exists(&Hydrogen::Curry::String::curry_ends_with_i), 'function exists';
    ok $EXPORTS{'curry_ends_with_i'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_ends_with_i( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_ends_with_i' );
};

subtest 'curry_eq' => sub {
    ok exists(&Hydrogen::Curry::String::curry_eq), 'function exists';
    ok $EXPORTS{'curry_eq'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_eq( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_eq' );
};

subtest 'curry_eqi' => sub {
    ok exists(&Hydrogen::Curry::String::curry_eqi), 'function exists';
    ok $EXPORTS{'curry_eqi'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_eqi( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_eqi' );
};

subtest 'curry_fc' => sub {
    ok exists(&Hydrogen::Curry::String::curry_fc), 'function exists';
    ok $EXPORTS{'curry_fc'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_fc( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_fc' );
};

subtest 'curry_ge' => sub {
    ok exists(&Hydrogen::Curry::String::curry_ge), 'function exists';
    ok $EXPORTS{'curry_ge'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_ge( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_ge' );
};

subtest 'curry_gei' => sub {
    ok exists(&Hydrogen::Curry::String::curry_gei), 'function exists';
    ok $EXPORTS{'curry_gei'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_gei( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_gei' );
};

subtest 'curry_get' => sub {
    ok exists(&Hydrogen::Curry::String::curry_get), 'function exists';
    ok $EXPORTS{'curry_get'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_get( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_get' );
};

subtest 'curry_gt' => sub {
    ok exists(&Hydrogen::Curry::String::curry_gt), 'function exists';
    ok $EXPORTS{'curry_gt'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_gt( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_gt' );
};

subtest 'curry_gti' => sub {
    ok exists(&Hydrogen::Curry::String::curry_gti), 'function exists';
    ok $EXPORTS{'curry_gti'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_gti( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_gti' );
};

subtest 'curry_inc' => sub {
    ok exists(&Hydrogen::Curry::String::curry_inc), 'function exists';
    ok $EXPORTS{'curry_inc'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_inc( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_inc' );
};

subtest 'curry_lc' => sub {
    ok exists(&Hydrogen::Curry::String::curry_lc), 'function exists';
    ok $EXPORTS{'curry_lc'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_lc( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_lc' );
};

subtest 'curry_le' => sub {
    ok exists(&Hydrogen::Curry::String::curry_le), 'function exists';
    ok $EXPORTS{'curry_le'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_le( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_le' );
};

subtest 'curry_lei' => sub {
    ok exists(&Hydrogen::Curry::String::curry_lei), 'function exists';
    ok $EXPORTS{'curry_lei'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_lei( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_lei' );
};

subtest 'curry_length' => sub {
    ok exists(&Hydrogen::Curry::String::curry_length), 'function exists';
    ok $EXPORTS{'curry_length'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_length( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_length' );
};

subtest 'curry_lt' => sub {
    ok exists(&Hydrogen::Curry::String::curry_lt), 'function exists';
    ok $EXPORTS{'curry_lt'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_lt( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_lt' );
};

subtest 'curry_lti' => sub {
    ok exists(&Hydrogen::Curry::String::curry_lti), 'function exists';
    ok $EXPORTS{'curry_lti'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_lti( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_lti' );
};

subtest 'curry_match' => sub {
    ok exists(&Hydrogen::Curry::String::curry_match), 'function exists';
    ok $EXPORTS{'curry_match'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_match( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_match' );
};

subtest 'curry_match_i' => sub {
    ok exists(&Hydrogen::Curry::String::curry_match_i), 'function exists';
    ok $EXPORTS{'curry_match_i'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_match_i( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_match_i' );
};

subtest 'curry_ne' => sub {
    ok exists(&Hydrogen::Curry::String::curry_ne), 'function exists';
    ok $EXPORTS{'curry_ne'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_ne( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_ne' );
};

subtest 'curry_nei' => sub {
    ok exists(&Hydrogen::Curry::String::curry_nei), 'function exists';
    ok $EXPORTS{'curry_nei'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_nei( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_nei' );
};

subtest 'curry_prepend' => sub {
    ok exists(&Hydrogen::Curry::String::curry_prepend), 'function exists';
    ok $EXPORTS{'curry_prepend'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_prepend( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_prepend' );
};

subtest 'curry_replace' => sub {
    ok exists(&Hydrogen::Curry::String::curry_replace), 'function exists';
    ok $EXPORTS{'curry_replace'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_replace( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_replace' );
};

subtest 'curry_replace_globally' => sub {
    ok exists(&Hydrogen::Curry::String::curry_replace_globally), 'function exists';
    ok $EXPORTS{'curry_replace_globally'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_replace_globally( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_replace_globally' );
};

subtest 'curry_reset' => sub {
    ok exists(&Hydrogen::Curry::String::curry_reset), 'function exists';
    ok $EXPORTS{'curry_reset'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_reset( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_reset' );
};

subtest 'curry_set' => sub {
    ok exists(&Hydrogen::Curry::String::curry_set), 'function exists';
    ok $EXPORTS{'curry_set'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_set( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_set' );
};

subtest 'curry_starts_with' => sub {
    ok exists(&Hydrogen::Curry::String::curry_starts_with), 'function exists';
    ok $EXPORTS{'curry_starts_with'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_starts_with( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_starts_with' );
};

subtest 'curry_starts_with_i' => sub {
    ok exists(&Hydrogen::Curry::String::curry_starts_with_i), 'function exists';
    ok $EXPORTS{'curry_starts_with_i'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_starts_with_i( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_starts_with_i' );
};

subtest 'curry_substr' => sub {
    ok exists(&Hydrogen::Curry::String::curry_substr), 'function exists';
    ok $EXPORTS{'curry_substr'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_substr( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_substr' );
};

subtest 'curry_uc' => sub {
    ok exists(&Hydrogen::Curry::String::curry_uc), 'function exists';
    ok $EXPORTS{'curry_uc'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::String::curry_uc( q{} );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_uc' );
};

# :)
done_testing;
