use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Counter;

isa_ok( 'Hydrogen::Counter', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Counter::EXPORT_OK;

subtest 'dec' => sub {
    ok exists(&Hydrogen::Counter::dec), 'function exists';
    ok $EXPORTS{'dec'}, 'function is importable';
    my $e = exception {
          my $testcounter = 10;
          Hydrogen::Counter::dec( $testcounter );
          Hydrogen::Counter::dec( $testcounter );
          is( $testcounter, 8, q{$testcounter is 8} );
          Hydrogen::Counter::dec( $testcounter, 5 );
          is( $testcounter, 3, q{$testcounter is 3} );
    };
    is( $e, undef, 'no exception thrown running dec example' );
};

subtest 'inc' => sub {
    ok exists(&Hydrogen::Counter::inc), 'function exists';
    ok $EXPORTS{'inc'}, 'function is importable';
    my $e = exception {
          my $testcounter = 0;
          Hydrogen::Counter::inc( $testcounter );
          Hydrogen::Counter::inc( $testcounter );
          is( $testcounter, 2, q{$testcounter is 2} );
          Hydrogen::Counter::inc( $testcounter, 3 );
          is( $testcounter, 5, q{$testcounter is 5} );
    };
    is( $e, undef, 'no exception thrown running inc example' );
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::Counter::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
    my $e = exception {
          my $testcounter = 10;
          Hydrogen::Counter::reset( $testcounter );
          is( $testcounter, 0, q{$testcounter is 0} );
    };
    is( $e, undef, 'no exception thrown running reset example' );
};

subtest 'set' => sub {
    ok exists(&Hydrogen::Counter::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $e = exception {
          my $testcounter = 0;
          Hydrogen::Counter::set( $testcounter, 5 );
          is( $testcounter, 5, q{$testcounter is 5} );
    };
    is( $e, undef, 'no exception thrown running set example' );
};

# :)
done_testing;
