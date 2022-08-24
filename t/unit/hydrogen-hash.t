use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Hash;

isa_ok( 'Hydrogen::Hash', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Hash::EXPORT_OK;

subtest 'accessor' => sub {
    ok exists(&Hydrogen::Hash::accessor), 'function exists';
    ok $EXPORTS{'accessor'}, 'function is importable';
};

subtest 'all' => sub {
    ok exists(&Hydrogen::Hash::all), 'function exists';
    ok $EXPORTS{'all'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          my %hash = Hydrogen::Hash::all( %testhash );
    };
    is( $e, undef, 'no exception thrown running all example' );
};

subtest 'clear' => sub {
    ok exists(&Hydrogen::Hash::clear), 'function exists';
    ok $EXPORTS{'clear'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          Hydrogen::Hash::clear( %testhash );
          ok( !(exists $testhash{foo}), q{exists $testhash{foo} is false} );
          ok( !(exists $testhash{bar}), q{exists $testhash{bar} is false} );
    };
    is( $e, undef, 'no exception thrown running clear example' );
};

subtest 'count' => sub {
    ok exists(&Hydrogen::Hash::count), 'function exists';
    ok $EXPORTS{'count'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          is( Hydrogen::Hash::count( %testhash ), 2, q{Hydrogen::Hash::count( %testhash ) is 2} );
    };
    is( $e, undef, 'no exception thrown running count example' );
};

subtest 'defined' => sub {
    ok exists(&Hydrogen::Hash::defined), 'function exists';
    ok $EXPORTS{'defined'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          is( Hydrogen::Hash::defined( %testhash, 'foo' ), 1, q{Hydrogen::Hash::defined( %testhash, 'foo' ) is 1} );
    };
    is( $e, undef, 'no exception thrown running defined example' );
};

subtest 'delete' => sub {
    ok exists(&Hydrogen::Hash::delete), 'function exists';
    ok $EXPORTS{'delete'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          Hydrogen::Hash::delete( %testhash, 'foo' );
          ok( !(exists $testhash{foo}), q{exists $testhash{foo} is false} );
    };
    is( $e, undef, 'no exception thrown running delete example' );
};

subtest 'elements' => sub {
    ok exists(&Hydrogen::Hash::elements), 'function exists';
    ok $EXPORTS{'elements'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          my %hash = Hydrogen::Hash::elements( %testhash );
    };
    is( $e, undef, 'no exception thrown running elements example' );
};

subtest 'exists' => sub {
    ok exists(&Hydrogen::Hash::exists), 'function exists';
    ok $EXPORTS{'exists'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          ok( Hydrogen::Hash::exists( %testhash, 'foo' ), q{Hydrogen::Hash::exists( %testhash, 'foo' ) is true} );
          ok( !(Hydrogen::Hash::exists( %testhash, 'baz' )), q{Hydrogen::Hash::exists( %testhash, 'baz' ) is false} );
    };
    is( $e, undef, 'no exception thrown running exists example' );
};

subtest 'for_each_key' => sub {
    ok exists(&Hydrogen::Hash::for_each_key), 'function exists';
    ok $EXPORTS{'for_each_key'}, 'function is importable';
};

subtest 'for_each_pair' => sub {
    ok exists(&Hydrogen::Hash::for_each_pair), 'function exists';
    ok $EXPORTS{'for_each_pair'}, 'function is importable';
};

subtest 'for_each_value' => sub {
    ok exists(&Hydrogen::Hash::for_each_value), 'function exists';
    ok $EXPORTS{'for_each_value'}, 'function is importable';
};

subtest 'get' => sub {
    ok exists(&Hydrogen::Hash::get), 'function exists';
    ok $EXPORTS{'get'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          is( Hydrogen::Hash::get( %testhash, 'bar' ), 1, q{Hydrogen::Hash::get( %testhash, 'bar' ) is 1} );
    };
    is( $e, undef, 'no exception thrown running get example' );
};

subtest 'is_empty' => sub {
    ok exists(&Hydrogen::Hash::is_empty), 'function exists';
    ok $EXPORTS{'is_empty'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          ok( !(Hydrogen::Hash::is_empty( %testhash )), q{Hydrogen::Hash::is_empty( %testhash ) is false} );
          %testhash = %{ + {}  };
          ok( Hydrogen::Hash::is_empty( %testhash ), q{Hydrogen::Hash::is_empty( %testhash ) is true} );
    };
    is( $e, undef, 'no exception thrown running is_empty example' );
};

subtest 'keys' => sub {
    ok exists(&Hydrogen::Hash::keys), 'function exists';
    ok $EXPORTS{'keys'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          # says 'foo' and 'bar' in an unpredictable order
          note for Hydrogen::Hash::keys( %testhash );
    };
    is( $e, undef, 'no exception thrown running keys example' );
};

subtest 'kv' => sub {
    ok exists(&Hydrogen::Hash::kv), 'function exists';
    ok $EXPORTS{'kv'}, 'function is importable';
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::Hash::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::Hash::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          Hydrogen::Hash::set( %testhash, bar => 2, baz => 1 );
          is( $testhash{foo}, 0, q{$testhash{foo} is 0} );
          is( $testhash{baz}, 1, q{$testhash{baz} is 1} );
          is( $testhash{bar}, 2, q{$testhash{bar} is 2} );
    };
    is( $e, undef, 'no exception thrown running set example' );
};

subtest 'shallow_clone' => sub {
    ok exists(&Hydrogen::Hash::shallow_clone), 'function exists';
    ok $EXPORTS{'shallow_clone'}, 'function is importable';
};

subtest 'sorted_keys' => sub {
    ok exists(&Hydrogen::Hash::sorted_keys), 'function exists';
    ok $EXPORTS{'sorted_keys'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          # says 'bar' then 'foo'
          note for Hydrogen::Hash::sorted_keys( %testhash );
    };
    is( $e, undef, 'no exception thrown running sorted_keys example' );
};

subtest 'values' => sub {
    ok exists(&Hydrogen::Hash::values), 'function exists';
    ok $EXPORTS{'values'}, 'function is importable';
    my $e = exception {
          my %testhash = %{ + { foo => 0, bar => 1 } };
          # says '0' and '1' in an unpredictable order
          note for Hydrogen::Hash::values( %testhash );
    };
    is( $e, undef, 'no exception thrown running values example' );
};

# :)
done_testing;
