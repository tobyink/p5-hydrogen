# This file was autogenerated.
use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Scalar;

isa_ok( 'Hydrogen::Scalar', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Scalar::EXPORT_OK;

subtest 'make_getter' => sub {
    ok exists(&Hydrogen::Scalar::make_getter), 'function exists';
    ok $EXPORTS{'make_getter'}, 'function is importable';
    my $e = exception {
          my $testscalar = 10;
          my $getter = Hydrogen::Scalar::make_getter( $testscalar );
          $testscalar = 11 ;
          is( $getter->(), 11, q{$getter->() is 11} );
    };
    is( $e, undef, 'no exception thrown running make_getter example' );
};

subtest 'make_setter' => sub {
    ok exists(&Hydrogen::Scalar::make_setter), 'function exists';
    ok $EXPORTS{'make_setter'}, 'function is importable';
    my $e = exception {
          my $testscalar = 10;
          my $setter = Hydrogen::Scalar::make_setter( $testscalar );
          $setter->( 11 );
          is( $testscalar, 11, q{$testscalar is 11} );
    };
    is( $e, undef, 'no exception thrown running make_setter example' );
};

# :)
done_testing;
