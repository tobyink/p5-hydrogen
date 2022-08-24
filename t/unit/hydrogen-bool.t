use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Bool;

isa_ok( 'Hydrogen::Bool', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Bool::EXPORT_OK;

subtest 'not' => sub {
    ok exists(&Hydrogen::Bool::not), 'function exists';
    ok $EXPORTS{'not'}, 'function is importable';
    my $e = exception {
          my $testbool = 1;
          ok( !(Hydrogen::Bool::not( $testbool )), q{Hydrogen::Bool::not( $testbool ) is false} );
    };
    is( $e, undef, 'no exception thrown running not example' );
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::Bool::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::Bool::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $e = exception {
          my $testbool = !!0;
          Hydrogen::Bool::set( $testbool );
          ok( $testbool, q{$testbool is true} );
    };
    is( $e, undef, 'no exception thrown running set example' );
};

subtest 'toggle' => sub {
    ok exists(&Hydrogen::Bool::toggle), 'function exists';
    ok $EXPORTS{'toggle'}, 'function is importable';
    my $e = exception {
          my $testbool = !!0;
          Hydrogen::Bool::toggle( $testbool );
          ok( $testbool, q{$testbool is true} );
          Hydrogen::Bool::toggle( $testbool );
          ok( !($testbool), q{$testbool is false} );
    };
    is( $e, undef, 'no exception thrown running toggle example' );
};

subtest 'unset' => sub {
    ok exists(&Hydrogen::Bool::unset), 'function exists';
    ok $EXPORTS{'unset'}, 'function is importable';
    my $e = exception {
          my $testbool = !!0;
          Hydrogen::Bool::unset( $testbool );
          ok( !($testbool), q{$testbool is false} );
    };
    is( $e, undef, 'no exception thrown running unset example' );
};

# :)
done_testing;
