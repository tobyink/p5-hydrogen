# This file was autogenerated.
use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::HashRef;

isa_ok( 'Hydrogen::HashRef', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::HashRef::EXPORT_OK;

subtest 'accessor' => sub {
    ok exists(&Hydrogen::HashRef::accessor), 'function exists';
    ok $EXPORTS{'accessor'}, 'function is importable';
};

subtest 'all' => sub {
    ok exists(&Hydrogen::HashRef::all), 'function exists';
    ok $EXPORTS{'all'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        my %hash = Hydrogen::HashRef::all( $testhashref );
    };
    is $e, undef, 'no exception thrown running all example';
};

subtest 'clear' => sub {
    ok exists(&Hydrogen::HashRef::clear), 'function exists';
    ok $EXPORTS{'clear'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        Hydrogen::HashRef::clear( $testhashref );
        ok( !(exists $testhashref->{foo}), q{exists $testhashref->{foo} is false} );
        ok( !(exists $testhashref->{bar}), q{exists $testhashref->{bar} is false} );
    };
    is $e, undef, 'no exception thrown running clear example';
};

subtest 'count' => sub {
    ok exists(&Hydrogen::HashRef::count), 'function exists';
    ok $EXPORTS{'count'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        is( Hydrogen::HashRef::count( $testhashref ), 2, q{Hydrogen::HashRef::count( $testhashref ) is 2} );
    };
    is $e, undef, 'no exception thrown running count example';
};

subtest 'defined' => sub {
    ok exists(&Hydrogen::HashRef::defined), 'function exists';
    ok $EXPORTS{'defined'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        is( Hydrogen::HashRef::defined( $testhashref, 'foo' ), 1, q{Hydrogen::HashRef::defined( $testhashref, 'foo' ) is 1} );
    };
    is $e, undef, 'no exception thrown running defined example';
};

subtest 'delete' => sub {
    ok exists(&Hydrogen::HashRef::delete), 'function exists';
    ok $EXPORTS{'delete'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        Hydrogen::HashRef::delete( $testhashref, 'foo' );
        ok( !(exists $testhashref->{foo}), q{exists $testhashref->{foo} is false} );
    };
    is $e, undef, 'no exception thrown running delete example';
};

subtest 'elements' => sub {
    ok exists(&Hydrogen::HashRef::elements), 'function exists';
    ok $EXPORTS{'elements'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        my %hash = Hydrogen::HashRef::elements( $testhashref );
    };
    is $e, undef, 'no exception thrown running elements example';
};

subtest 'exists' => sub {
    ok exists(&Hydrogen::HashRef::exists), 'function exists';
    ok $EXPORTS{'exists'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        ok( Hydrogen::HashRef::exists( $testhashref, 'foo' ), q{Hydrogen::HashRef::exists( $testhashref, 'foo' ) is true} );
        ok( !(Hydrogen::HashRef::exists( $testhashref, 'baz' )), q{Hydrogen::HashRef::exists( $testhashref, 'baz' ) is false} );
    };
    is $e, undef, 'no exception thrown running exists example';
};

subtest 'for_each_key' => sub {
    ok exists(&Hydrogen::HashRef::for_each_key), 'function exists';
    ok $EXPORTS{'for_each_key'}, 'function is importable';
};

subtest 'for_each_pair' => sub {
    ok exists(&Hydrogen::HashRef::for_each_pair), 'function exists';
    ok $EXPORTS{'for_each_pair'}, 'function is importable';
};

subtest 'for_each_value' => sub {
    ok exists(&Hydrogen::HashRef::for_each_value), 'function exists';
    ok $EXPORTS{'for_each_value'}, 'function is importable';
};

subtest 'get' => sub {
    ok exists(&Hydrogen::HashRef::get), 'function exists';
    ok $EXPORTS{'get'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        is( Hydrogen::HashRef::get( $testhashref, 'bar' ), 1, q{Hydrogen::HashRef::get( $testhashref, 'bar' ) is 1} );
    };
    is $e, undef, 'no exception thrown running get example';
};

subtest 'is_empty' => sub {
    ok exists(&Hydrogen::HashRef::is_empty), 'function exists';
    ok $EXPORTS{'is_empty'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        ok( !(Hydrogen::HashRef::is_empty( $testhashref )), q{Hydrogen::HashRef::is_empty( $testhashref ) is false} );
        $testhashref = {} ;
        ok( Hydrogen::HashRef::is_empty( $testhashref ), q{Hydrogen::HashRef::is_empty( $testhashref ) is true} );
    };
    is $e, undef, 'no exception thrown running is_empty example';
};

subtest 'keys' => sub {
    ok exists(&Hydrogen::HashRef::keys), 'function exists';
    ok $EXPORTS{'keys'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        # says 'foo' and 'bar' in an unpredictable order
        note for Hydrogen::HashRef::keys( $testhashref );
    };
    is $e, undef, 'no exception thrown running keys example';
};

subtest 'kv' => sub {
    ok exists(&Hydrogen::HashRef::kv), 'function exists';
    ok $EXPORTS{'kv'}, 'function is importable';
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::HashRef::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::HashRef::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        Hydrogen::HashRef::set( $testhashref, bar => 2, baz => 1 );
        is( $testhashref->{foo}, 0, q{$testhashref->{foo} is 0} );
        is( $testhashref->{baz}, 1, q{$testhashref->{baz} is 1} );
        is( $testhashref->{bar}, 2, q{$testhashref->{bar} is 2} );
    };
    is $e, undef, 'no exception thrown running set example';
};

subtest 'shallow_clone' => sub {
    ok exists(&Hydrogen::HashRef::shallow_clone), 'function exists';
    ok $EXPORTS{'shallow_clone'}, 'function is importable';
};

subtest 'sorted_keys' => sub {
    ok exists(&Hydrogen::HashRef::sorted_keys), 'function exists';
    ok $EXPORTS{'sorted_keys'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        # says 'bar' then 'foo'
        note for Hydrogen::HashRef::sorted_keys( $testhashref );
    };
    is $e, undef, 'no exception thrown running sorted_keys example';
};

subtest 'values' => sub {
    ok exists(&Hydrogen::HashRef::values), 'function exists';
    ok $EXPORTS{'values'}, 'function is importable';
    my $e = exception {
        my $testhashref = { foo => 0, bar => 1 };
        # says '0' and '1' in an unpredictable order
        note for Hydrogen::HashRef::values( $testhashref );
    };
    is $e, undef, 'no exception thrown running values example';
};

# :)
done_testing;
