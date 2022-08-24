use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Array;

isa_ok( 'Hydrogen::Array', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Array::EXPORT_OK;

subtest 'accessor' => sub {
    ok exists(&Hydrogen::Array::accessor), 'function exists';
    ok $EXPORTS{'accessor'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          Hydrogen::Array::accessor( @testarray, 1, 'quux' );
          is_deeply( \@testarray, [ 'foo', 'quux', 'baz' ], q{@testarray deep match} );
          is( Hydrogen::Array::accessor( @testarray, 2 ), 'baz', q{Hydrogen::Array::accessor( @testarray, 2 ) is 'baz'} );
    };
    is( $e, undef, 'no exception thrown running accessor example' );
};

subtest 'all' => sub {
    ok exists(&Hydrogen::Array::all), 'function exists';
    ok $EXPORTS{'all'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar' ] };
          my @list = Hydrogen::Array::all( @testarray );
    };
    is( $e, undef, 'no exception thrown running all example' );
};

subtest 'all_true' => sub {
    ok exists(&Hydrogen::Array::all_true), 'function exists';
    ok $EXPORTS{'all_true'}, 'function is importable';
};

subtest 'any' => sub {
    ok exists(&Hydrogen::Array::any), 'function exists';
    ok $EXPORTS{'any'}, 'function is importable';
};

subtest 'apply' => sub {
    ok exists(&Hydrogen::Array::apply), 'function exists';
    ok $EXPORTS{'apply'}, 'function is importable';
};

subtest 'clear' => sub {
    ok exists(&Hydrogen::Array::clear), 'function exists';
    ok $EXPORTS{'clear'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo' ] };
          Hydrogen::Array::clear( @testarray );
          is_deeply( \@testarray, [], q{@testarray deep match} );
    };
    is( $e, undef, 'no exception thrown running clear example' );
};

subtest 'count' => sub {
    ok exists(&Hydrogen::Array::count), 'function exists';
    ok $EXPORTS{'count'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar' ] };
          is( Hydrogen::Array::count( @testarray ), 2, q{Hydrogen::Array::count( @testarray ) is 2} );
    };
    is( $e, undef, 'no exception thrown running count example' );
};

subtest 'delete' => sub {
    ok exists(&Hydrogen::Array::delete), 'function exists';
    ok $EXPORTS{'delete'}, 'function is importable';
};

subtest 'elements' => sub {
    ok exists(&Hydrogen::Array::elements), 'function exists';
    ok $EXPORTS{'elements'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar' ] };
          my @list = Hydrogen::Array::elements( @testarray );
    };
    is( $e, undef, 'no exception thrown running elements example' );
};

subtest 'first' => sub {
    ok exists(&Hydrogen::Array::first), 'function exists';
    ok $EXPORTS{'first'}, 'function is importable';
};

subtest 'first_index' => sub {
    ok exists(&Hydrogen::Array::first_index), 'function exists';
    ok $EXPORTS{'first_index'}, 'function is importable';
};

subtest 'flatten' => sub {
    ok exists(&Hydrogen::Array::flatten), 'function exists';
    ok $EXPORTS{'flatten'}, 'function is importable';
};

subtest 'flatten_deep' => sub {
    ok exists(&Hydrogen::Array::flatten_deep), 'function exists';
    ok $EXPORTS{'flatten_deep'}, 'function is importable';
};

subtest 'for_each' => sub {
    ok exists(&Hydrogen::Array::for_each), 'function exists';
    ok $EXPORTS{'for_each'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          Hydrogen::Array::for_each( @testarray, sub { note "Item $_[1] is $_[0]." } );
    };
    is( $e, undef, 'no exception thrown running for_each example' );
};

subtest 'for_each_pair' => sub {
    ok exists(&Hydrogen::Array::for_each_pair), 'function exists';
    ok $EXPORTS{'for_each_pair'}, 'function is importable';
};

subtest 'get' => sub {
    ok exists(&Hydrogen::Array::get), 'function exists';
    ok $EXPORTS{'get'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          is( Hydrogen::Array::get( @testarray,  0 ), 'foo', q{Hydrogen::Array::get( @testarray,  0 ) is 'foo'} );
          is( Hydrogen::Array::get( @testarray,  1 ), 'bar', q{Hydrogen::Array::get( @testarray,  1 ) is 'bar'} );
          is( Hydrogen::Array::get( @testarray, -1 ), 'baz', q{Hydrogen::Array::get( @testarray, -1 ) is 'baz'} );
    };
    is( $e, undef, 'no exception thrown running get example' );
};

subtest 'grep' => sub {
    ok exists(&Hydrogen::Array::grep), 'function exists';
    ok $EXPORTS{'grep'}, 'function is importable';
};

subtest 'head' => sub {
    ok exists(&Hydrogen::Array::head), 'function exists';
    ok $EXPORTS{'head'}, 'function is importable';
};

subtest 'insert' => sub {
    ok exists(&Hydrogen::Array::insert), 'function exists';
    ok $EXPORTS{'insert'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          Hydrogen::Array::insert( @testarray, 1, 'quux' );
          is_deeply( \@testarray, [ 'foo', 'quux', 'bar', 'baz' ], q{@testarray deep match} );
    };
    is( $e, undef, 'no exception thrown running insert example' );
};

subtest 'is_empty' => sub {
    ok exists(&Hydrogen::Array::is_empty), 'function exists';
    ok $EXPORTS{'is_empty'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar' ] };
          ok( !(Hydrogen::Array::is_empty( @testarray )), q{Hydrogen::Array::is_empty( @testarray ) is false} );
          @testarray = @{ + []  };
          ok( Hydrogen::Array::is_empty( @testarray ), q{Hydrogen::Array::is_empty( @testarray ) is true} );
    };
    is( $e, undef, 'no exception thrown running is_empty example' );
};

subtest 'join' => sub {
    ok exists(&Hydrogen::Array::join), 'function exists';
    ok $EXPORTS{'join'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          is( Hydrogen::Array::join( @testarray ), 'foo,bar,baz', q{Hydrogen::Array::join( @testarray ) is 'foo,bar,baz'} );
          is( Hydrogen::Array::join( @testarray, '|' ), 'foo|bar|baz', q{Hydrogen::Array::join( @testarray, '|' ) is 'foo|bar|baz'} );
    };
    is( $e, undef, 'no exception thrown running join example' );
};

subtest 'map' => sub {
    ok exists(&Hydrogen::Array::map), 'function exists';
    ok $EXPORTS{'map'}, 'function is importable';
};

subtest 'max' => sub {
    ok exists(&Hydrogen::Array::max), 'function exists';
    ok $EXPORTS{'max'}, 'function is importable';
};

subtest 'maxstr' => sub {
    ok exists(&Hydrogen::Array::maxstr), 'function exists';
    ok $EXPORTS{'maxstr'}, 'function is importable';
};

subtest 'min' => sub {
    ok exists(&Hydrogen::Array::min), 'function exists';
    ok $EXPORTS{'min'}, 'function is importable';
};

subtest 'minstr' => sub {
    ok exists(&Hydrogen::Array::minstr), 'function exists';
    ok $EXPORTS{'minstr'}, 'function is importable';
};

subtest 'natatime' => sub {
    ok exists(&Hydrogen::Array::natatime), 'function exists';
    ok $EXPORTS{'natatime'}, 'function is importable';
};

subtest 'not_all_true' => sub {
    ok exists(&Hydrogen::Array::not_all_true), 'function exists';
    ok $EXPORTS{'not_all_true'}, 'function is importable';
};

subtest 'pairfirst' => sub {
    ok exists(&Hydrogen::Array::pairfirst), 'function exists';
    ok $EXPORTS{'pairfirst'}, 'function is importable';
};

subtest 'pairgrep' => sub {
    ok exists(&Hydrogen::Array::pairgrep), 'function exists';
    ok $EXPORTS{'pairgrep'}, 'function is importable';
};

subtest 'pairkeys' => sub {
    ok exists(&Hydrogen::Array::pairkeys), 'function exists';
    ok $EXPORTS{'pairkeys'}, 'function is importable';
};

subtest 'pairmap' => sub {
    ok exists(&Hydrogen::Array::pairmap), 'function exists';
    ok $EXPORTS{'pairmap'}, 'function is importable';
};

subtest 'pairs' => sub {
    ok exists(&Hydrogen::Array::pairs), 'function exists';
    ok $EXPORTS{'pairs'}, 'function is importable';
};

subtest 'pairvalues' => sub {
    ok exists(&Hydrogen::Array::pairvalues), 'function exists';
    ok $EXPORTS{'pairvalues'}, 'function is importable';
};

subtest 'pick_random' => sub {
    ok exists(&Hydrogen::Array::pick_random), 'function exists';
    ok $EXPORTS{'pick_random'}, 'function is importable';
};

subtest 'pop' => sub {
    ok exists(&Hydrogen::Array::pop), 'function exists';
    ok $EXPORTS{'pop'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          is( Hydrogen::Array::pop( @testarray ), 'baz', q{Hydrogen::Array::pop( @testarray ) is 'baz'} );
          is( Hydrogen::Array::pop( @testarray ), 'bar', q{Hydrogen::Array::pop( @testarray ) is 'bar'} );
          is_deeply( \@testarray, [ 'foo' ], q{@testarray deep match} );
    };
    is( $e, undef, 'no exception thrown running pop example' );
};

subtest 'print' => sub {
    ok exists(&Hydrogen::Array::print), 'function exists';
    ok $EXPORTS{'print'}, 'function is importable';
};

subtest 'product' => sub {
    ok exists(&Hydrogen::Array::product), 'function exists';
    ok $EXPORTS{'product'}, 'function is importable';
};

subtest 'push' => sub {
    ok exists(&Hydrogen::Array::push), 'function exists';
    ok $EXPORTS{'push'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo' ] };
          Hydrogen::Array::push( @testarray, 'bar', 'baz' );
          is_deeply( \@testarray, [ 'foo', 'bar', 'baz' ], q{@testarray deep match} );
    };
    is( $e, undef, 'no exception thrown running push example' );
};

subtest 'reduce' => sub {
    ok exists(&Hydrogen::Array::reduce), 'function exists';
    ok $EXPORTS{'reduce'}, 'function is importable';
};

subtest 'reductions' => sub {
    ok exists(&Hydrogen::Array::reductions), 'function exists';
    ok $EXPORTS{'reductions'}, 'function is importable';
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::Array::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          Hydrogen::Array::reset( @testarray );
          is_deeply( \@testarray, [], q{@testarray deep match} );
    };
    is( $e, undef, 'no exception thrown running reset example' );
};

subtest 'reverse' => sub {
    ok exists(&Hydrogen::Array::reverse), 'function exists';
    ok $EXPORTS{'reverse'}, 'function is importable';
};

subtest 'sample' => sub {
    ok exists(&Hydrogen::Array::sample), 'function exists';
    ok $EXPORTS{'sample'}, 'function is importable';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::Array::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          Hydrogen::Array::set( @testarray, 1, 'quux' );
          is_deeply( \@testarray, [ 'foo', 'quux', 'baz' ], q{@testarray deep match} );
    };
    is( $e, undef, 'no exception thrown running set example' );
};

subtest 'shallow_clone' => sub {
    ok exists(&Hydrogen::Array::shallow_clone), 'function exists';
    ok $EXPORTS{'shallow_clone'}, 'function is importable';
};

subtest 'shift' => sub {
    ok exists(&Hydrogen::Array::shift), 'function exists';
    ok $EXPORTS{'shift'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo', 'bar', 'baz' ] };
          is( Hydrogen::Array::shift( @testarray ), 'foo', q{Hydrogen::Array::shift( @testarray ) is 'foo'} );
          is( Hydrogen::Array::shift( @testarray ), 'bar', q{Hydrogen::Array::shift( @testarray ) is 'bar'} );
          is_deeply( \@testarray, [ 'baz' ], q{@testarray deep match} );
    };
    is( $e, undef, 'no exception thrown running shift example' );
};

subtest 'shuffle' => sub {
    ok exists(&Hydrogen::Array::shuffle), 'function exists';
    ok $EXPORTS{'shuffle'}, 'function is importable';
};

subtest 'shuffle_in_place' => sub {
    ok exists(&Hydrogen::Array::shuffle_in_place), 'function exists';
    ok $EXPORTS{'shuffle_in_place'}, 'function is importable';
};

subtest 'sort' => sub {
    ok exists(&Hydrogen::Array::sort), 'function exists';
    ok $EXPORTS{'sort'}, 'function is importable';
};

subtest 'sort_in_place' => sub {
    ok exists(&Hydrogen::Array::sort_in_place), 'function exists';
    ok $EXPORTS{'sort_in_place'}, 'function is importable';
};

subtest 'splice' => sub {
    ok exists(&Hydrogen::Array::splice), 'function exists';
    ok $EXPORTS{'splice'}, 'function is importable';
};

subtest 'sum' => sub {
    ok exists(&Hydrogen::Array::sum), 'function exists';
    ok $EXPORTS{'sum'}, 'function is importable';
};

subtest 'tail' => sub {
    ok exists(&Hydrogen::Array::tail), 'function exists';
    ok $EXPORTS{'tail'}, 'function is importable';
};

subtest 'uniq' => sub {
    ok exists(&Hydrogen::Array::uniq), 'function exists';
    ok $EXPORTS{'uniq'}, 'function is importable';
};

subtest 'uniq_in_place' => sub {
    ok exists(&Hydrogen::Array::uniq_in_place), 'function exists';
    ok $EXPORTS{'uniq_in_place'}, 'function is importable';
};

subtest 'uniqnum' => sub {
    ok exists(&Hydrogen::Array::uniqnum), 'function exists';
    ok $EXPORTS{'uniqnum'}, 'function is importable';
};

subtest 'uniqnum_in_place' => sub {
    ok exists(&Hydrogen::Array::uniqnum_in_place), 'function exists';
    ok $EXPORTS{'uniqnum_in_place'}, 'function is importable';
};

subtest 'uniqstr' => sub {
    ok exists(&Hydrogen::Array::uniqstr), 'function exists';
    ok $EXPORTS{'uniqstr'}, 'function is importable';
};

subtest 'uniqstr_in_place' => sub {
    ok exists(&Hydrogen::Array::uniqstr_in_place), 'function exists';
    ok $EXPORTS{'uniqstr_in_place'}, 'function is importable';
};

subtest 'unshift' => sub {
    ok exists(&Hydrogen::Array::unshift), 'function exists';
    ok $EXPORTS{'unshift'}, 'function is importable';
    my $e = exception {
          my @testarray = @{ + [ 'foo' ] };
          Hydrogen::Array::unshift( @testarray, 'bar', 'baz' );
          is_deeply( \@testarray, [ 'bar', 'baz', 'foo' ], q{@testarray deep match} );
    };
    is( $e, undef, 'no exception thrown running unshift example' );
};

# :)
done_testing;
