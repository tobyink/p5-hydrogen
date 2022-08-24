# This file was autogenerated.
use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Curry::Scalar;

isa_ok( 'Hydrogen::Curry::Scalar', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Curry::Scalar::EXPORT_OK;

subtest 'curry_make_getter' => sub {
    ok exists(&Hydrogen::Curry::Scalar::curry_make_getter), 'function exists';
    ok $EXPORTS{'curry_make_getter'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Scalar::curry_make_getter( undef );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_make_getter' );
};

subtest 'curry_make_setter' => sub {
    ok exists(&Hydrogen::Curry::Scalar::curry_make_setter), 'function exists';
    ok $EXPORTS{'curry_make_setter'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::Scalar::curry_make_setter( undef );
        is( ref( $curried ), 'CODE', 'function returns a coderef' );
    };
    is( $e, undef, 'no exception thrown running curry_make_setter' );
};

# :)
done_testing;
