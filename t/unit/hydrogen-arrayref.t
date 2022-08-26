# This file was autogenerated.

=head1 NAME

hydrogen-arrayref.t - unit tests for Hydrogen::ArrayRef

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
use Test2::V0 -target => "Hydrogen::ArrayRef";

isa_ok( 'Hydrogen::ArrayRef', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::ArrayRef::EXPORT_OK;

subtest 'accessor' => sub {
    ok exists(&Hydrogen::ArrayRef::accessor), 'function exists';
    ok $EXPORTS{'accessor'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        Hydrogen::ArrayRef::accessor( $testarrayref, 1, 'quux' );
        is( $testarrayref, [ 'foo', 'quux', 'baz' ], q{$testarrayref deep match} );
        is( Hydrogen::ArrayRef::accessor( $testarrayref, 2 ), 'baz', q{Hydrogen::ArrayRef::accessor( $testarrayref, 2 ) is 'baz'} );
    };
    is $exception, undef, 'no exception thrown running accessor example';
};

subtest 'all' => sub {
    ok exists(&Hydrogen::ArrayRef::all), 'function exists';
    ok $EXPORTS{'all'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar' ];
        my @list = Hydrogen::ArrayRef::all( $testarrayref );
    };
    is $exception, undef, 'no exception thrown running all example';
};

subtest 'all_true' => sub {
    ok exists(&Hydrogen::ArrayRef::all_true), 'function exists';
    ok $EXPORTS{'all_true'}, 'function is importable';
};

subtest 'any' => sub {
    ok exists(&Hydrogen::ArrayRef::any), 'function exists';
    ok $EXPORTS{'any'}, 'function is importable';
};

subtest 'apply' => sub {
    ok exists(&Hydrogen::ArrayRef::apply), 'function exists';
    ok $EXPORTS{'apply'}, 'function is importable';
};

subtest 'clear' => sub {
    ok exists(&Hydrogen::ArrayRef::clear), 'function exists';
    ok $EXPORTS{'clear'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo' ];
        Hydrogen::ArrayRef::clear( $testarrayref );
        is( $testarrayref, [], q{$testarrayref deep match} );
    };
    is $exception, undef, 'no exception thrown running clear example';
};

subtest 'count' => sub {
    ok exists(&Hydrogen::ArrayRef::count), 'function exists';
    ok $EXPORTS{'count'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar' ];
        is( Hydrogen::ArrayRef::count( $testarrayref ), 2, q{Hydrogen::ArrayRef::count( $testarrayref ) is 2} );
    };
    is $exception, undef, 'no exception thrown running count example';
};

subtest 'delete' => sub {
    ok exists(&Hydrogen::ArrayRef::delete), 'function exists';
    ok $EXPORTS{'delete'}, 'function is importable';
};

subtest 'elements' => sub {
    ok exists(&Hydrogen::ArrayRef::elements), 'function exists';
    ok $EXPORTS{'elements'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar' ];
        my @list = Hydrogen::ArrayRef::elements( $testarrayref );
    };
    is $exception, undef, 'no exception thrown running elements example';
};

subtest 'first' => sub {
    ok exists(&Hydrogen::ArrayRef::first), 'function exists';
    ok $EXPORTS{'first'}, 'function is importable';
};

subtest 'first_index' => sub {
    ok exists(&Hydrogen::ArrayRef::first_index), 'function exists';
    ok $EXPORTS{'first_index'}, 'function is importable';
};

subtest 'flatten' => sub {
    ok exists(&Hydrogen::ArrayRef::flatten), 'function exists';
    ok $EXPORTS{'flatten'}, 'function is importable';
};

subtest 'flatten_deep' => sub {
    ok exists(&Hydrogen::ArrayRef::flatten_deep), 'function exists';
    ok $EXPORTS{'flatten_deep'}, 'function is importable';
};

subtest 'for_each' => sub {
    ok exists(&Hydrogen::ArrayRef::for_each), 'function exists';
    ok $EXPORTS{'for_each'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        Hydrogen::ArrayRef::for_each( $testarrayref, sub { note "Item $_[1] is $_[0]." } );
    };
    is $exception, undef, 'no exception thrown running for_each example';
};

subtest 'for_each_pair' => sub {
    ok exists(&Hydrogen::ArrayRef::for_each_pair), 'function exists';
    ok $EXPORTS{'for_each_pair'}, 'function is importable';
};

subtest 'get' => sub {
    ok exists(&Hydrogen::ArrayRef::get), 'function exists';
    ok $EXPORTS{'get'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        is( Hydrogen::ArrayRef::get( $testarrayref,  0 ), 'foo', q{Hydrogen::ArrayRef::get( $testarrayref,  0 ) is 'foo'} );
        is( Hydrogen::ArrayRef::get( $testarrayref,  1 ), 'bar', q{Hydrogen::ArrayRef::get( $testarrayref,  1 ) is 'bar'} );
        is( Hydrogen::ArrayRef::get( $testarrayref, -1 ), 'baz', q{Hydrogen::ArrayRef::get( $testarrayref, -1 ) is 'baz'} );
    };
    is $exception, undef, 'no exception thrown running get example';
};

subtest 'grep' => sub {
    ok exists(&Hydrogen::ArrayRef::grep), 'function exists';
    ok $EXPORTS{'grep'}, 'function is importable';
};

subtest 'head' => sub {
    ok exists(&Hydrogen::ArrayRef::head), 'function exists';
    ok $EXPORTS{'head'}, 'function is importable';
};

subtest 'insert' => sub {
    ok exists(&Hydrogen::ArrayRef::insert), 'function exists';
    ok $EXPORTS{'insert'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        Hydrogen::ArrayRef::insert( $testarrayref, 1, 'quux' );
        is( $testarrayref, [ 'foo', 'quux', 'bar', 'baz' ], q{$testarrayref deep match} );
    };
    is $exception, undef, 'no exception thrown running insert example';
};

subtest 'is_empty' => sub {
    ok exists(&Hydrogen::ArrayRef::is_empty), 'function exists';
    ok $EXPORTS{'is_empty'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar' ];
        ok( !(Hydrogen::ArrayRef::is_empty( $testarrayref )), q{Hydrogen::ArrayRef::is_empty( $testarrayref ) is false} );
        $testarrayref = [] ;
        ok( Hydrogen::ArrayRef::is_empty( $testarrayref ), q{Hydrogen::ArrayRef::is_empty( $testarrayref ) is true} );
    };
    is $exception, undef, 'no exception thrown running is_empty example';
};

subtest 'join' => sub {
    ok exists(&Hydrogen::ArrayRef::join), 'function exists';
    ok $EXPORTS{'join'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        is( Hydrogen::ArrayRef::join( $testarrayref ), 'foo,bar,baz', q{Hydrogen::ArrayRef::join( $testarrayref ) is 'foo,bar,baz'} );
        is( Hydrogen::ArrayRef::join( $testarrayref, '|' ), 'foo|bar|baz', q{Hydrogen::ArrayRef::join( $testarrayref, '|' ) is 'foo|bar|baz'} );
    };
    is $exception, undef, 'no exception thrown running join example';
};

subtest 'map' => sub {
    ok exists(&Hydrogen::ArrayRef::map), 'function exists';
    ok $EXPORTS{'map'}, 'function is importable';
};

subtest 'max' => sub {
    ok exists(&Hydrogen::ArrayRef::max), 'function exists';
    ok $EXPORTS{'max'}, 'function is importable';
};

subtest 'maxstr' => sub {
    ok exists(&Hydrogen::ArrayRef::maxstr), 'function exists';
    ok $EXPORTS{'maxstr'}, 'function is importable';
};

subtest 'min' => sub {
    ok exists(&Hydrogen::ArrayRef::min), 'function exists';
    ok $EXPORTS{'min'}, 'function is importable';
};

subtest 'minstr' => sub {
    ok exists(&Hydrogen::ArrayRef::minstr), 'function exists';
    ok $EXPORTS{'minstr'}, 'function is importable';
};

subtest 'natatime' => sub {
    ok exists(&Hydrogen::ArrayRef::natatime), 'function exists';
    ok $EXPORTS{'natatime'}, 'function is importable';
};

subtest 'not_all_true' => sub {
    ok exists(&Hydrogen::ArrayRef::not_all_true), 'function exists';
    ok $EXPORTS{'not_all_true'}, 'function is importable';
};

subtest 'pairfirst' => sub {
    ok exists(&Hydrogen::ArrayRef::pairfirst), 'function exists';
    ok $EXPORTS{'pairfirst'}, 'function is importable';
};

subtest 'pairgrep' => sub {
    ok exists(&Hydrogen::ArrayRef::pairgrep), 'function exists';
    ok $EXPORTS{'pairgrep'}, 'function is importable';
};

subtest 'pairkeys' => sub {
    ok exists(&Hydrogen::ArrayRef::pairkeys), 'function exists';
    ok $EXPORTS{'pairkeys'}, 'function is importable';
};

subtest 'pairmap' => sub {
    ok exists(&Hydrogen::ArrayRef::pairmap), 'function exists';
    ok $EXPORTS{'pairmap'}, 'function is importable';
};

subtest 'pairs' => sub {
    ok exists(&Hydrogen::ArrayRef::pairs), 'function exists';
    ok $EXPORTS{'pairs'}, 'function is importable';
};

subtest 'pairvalues' => sub {
    ok exists(&Hydrogen::ArrayRef::pairvalues), 'function exists';
    ok $EXPORTS{'pairvalues'}, 'function is importable';
};

subtest 'pick_random' => sub {
    ok exists(&Hydrogen::ArrayRef::pick_random), 'function exists';
    ok $EXPORTS{'pick_random'}, 'function is importable';
};

subtest 'pop' => sub {
    ok exists(&Hydrogen::ArrayRef::pop), 'function exists';
    ok $EXPORTS{'pop'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        is( Hydrogen::ArrayRef::pop( $testarrayref ), 'baz', q{Hydrogen::ArrayRef::pop( $testarrayref ) is 'baz'} );
        is( Hydrogen::ArrayRef::pop( $testarrayref ), 'bar', q{Hydrogen::ArrayRef::pop( $testarrayref ) is 'bar'} );
        is( $testarrayref, [ 'foo' ], q{$testarrayref deep match} );
    };
    is $exception, undef, 'no exception thrown running pop example';
};

subtest 'print' => sub {
    ok exists(&Hydrogen::ArrayRef::print), 'function exists';
    ok $EXPORTS{'print'}, 'function is importable';
};

subtest 'product' => sub {
    ok exists(&Hydrogen::ArrayRef::product), 'function exists';
    ok $EXPORTS{'product'}, 'function is importable';
};

subtest 'push' => sub {
    ok exists(&Hydrogen::ArrayRef::push), 'function exists';
    ok $EXPORTS{'push'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo' ];
        Hydrogen::ArrayRef::push( $testarrayref, 'bar', 'baz' );
        is( $testarrayref, [ 'foo', 'bar', 'baz' ], q{$testarrayref deep match} );
    };
    is $exception, undef, 'no exception thrown running push example';
};

subtest 'reduce' => sub {
    ok exists(&Hydrogen::ArrayRef::reduce), 'function exists';
    ok $EXPORTS{'reduce'}, 'function is importable';
};

subtest 'reductions' => sub {
    ok exists(&Hydrogen::ArrayRef::reductions), 'function exists';
    ok $EXPORTS{'reductions'}, 'function is importable';
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::ArrayRef::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        Hydrogen::ArrayRef::reset( $testarrayref );
        is( $testarrayref, [], q{$testarrayref deep match} );
    };
    is $exception, undef, 'no exception thrown running reset example';
};

subtest 'reverse' => sub {
    ok exists(&Hydrogen::ArrayRef::reverse), 'function exists';
    ok $EXPORTS{'reverse'}, 'function is importable';
};

subtest 'sample' => sub {
    ok exists(&Hydrogen::ArrayRef::sample), 'function exists';
    ok $EXPORTS{'sample'}, 'function is importable';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::ArrayRef::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        Hydrogen::ArrayRef::set( $testarrayref, 1, 'quux' );
        is( $testarrayref, [ 'foo', 'quux', 'baz' ], q{$testarrayref deep match} );
    };
    is $exception, undef, 'no exception thrown running set example';
};

subtest 'shallow_clone' => sub {
    ok exists(&Hydrogen::ArrayRef::shallow_clone), 'function exists';
    ok $EXPORTS{'shallow_clone'}, 'function is importable';
};

subtest 'shift' => sub {
    ok exists(&Hydrogen::ArrayRef::shift), 'function exists';
    ok $EXPORTS{'shift'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo', 'bar', 'baz' ];
        is( Hydrogen::ArrayRef::shift( $testarrayref ), 'foo', q{Hydrogen::ArrayRef::shift( $testarrayref ) is 'foo'} );
        is( Hydrogen::ArrayRef::shift( $testarrayref ), 'bar', q{Hydrogen::ArrayRef::shift( $testarrayref ) is 'bar'} );
        is( $testarrayref, [ 'baz' ], q{$testarrayref deep match} );
    };
    is $exception, undef, 'no exception thrown running shift example';
};

subtest 'shuffle' => sub {
    ok exists(&Hydrogen::ArrayRef::shuffle), 'function exists';
    ok $EXPORTS{'shuffle'}, 'function is importable';
};

subtest 'shuffle_in_place' => sub {
    ok exists(&Hydrogen::ArrayRef::shuffle_in_place), 'function exists';
    ok $EXPORTS{'shuffle_in_place'}, 'function is importable';
};

subtest 'sort' => sub {
    ok exists(&Hydrogen::ArrayRef::sort), 'function exists';
    ok $EXPORTS{'sort'}, 'function is importable';
};

subtest 'sort_in_place' => sub {
    ok exists(&Hydrogen::ArrayRef::sort_in_place), 'function exists';
    ok $EXPORTS{'sort_in_place'}, 'function is importable';
};

subtest 'splice' => sub {
    ok exists(&Hydrogen::ArrayRef::splice), 'function exists';
    ok $EXPORTS{'splice'}, 'function is importable';
};

subtest 'sum' => sub {
    ok exists(&Hydrogen::ArrayRef::sum), 'function exists';
    ok $EXPORTS{'sum'}, 'function is importable';
};

subtest 'tail' => sub {
    ok exists(&Hydrogen::ArrayRef::tail), 'function exists';
    ok $EXPORTS{'tail'}, 'function is importable';
};

subtest 'uniq' => sub {
    ok exists(&Hydrogen::ArrayRef::uniq), 'function exists';
    ok $EXPORTS{'uniq'}, 'function is importable';
};

subtest 'uniq_in_place' => sub {
    ok exists(&Hydrogen::ArrayRef::uniq_in_place), 'function exists';
    ok $EXPORTS{'uniq_in_place'}, 'function is importable';
};

subtest 'uniqnum' => sub {
    ok exists(&Hydrogen::ArrayRef::uniqnum), 'function exists';
    ok $EXPORTS{'uniqnum'}, 'function is importable';
};

subtest 'uniqnum_in_place' => sub {
    ok exists(&Hydrogen::ArrayRef::uniqnum_in_place), 'function exists';
    ok $EXPORTS{'uniqnum_in_place'}, 'function is importable';
};

subtest 'uniqstr' => sub {
    ok exists(&Hydrogen::ArrayRef::uniqstr), 'function exists';
    ok $EXPORTS{'uniqstr'}, 'function is importable';
};

subtest 'uniqstr_in_place' => sub {
    ok exists(&Hydrogen::ArrayRef::uniqstr_in_place), 'function exists';
    ok $EXPORTS{'uniqstr_in_place'}, 'function is importable';
};

subtest 'unshift' => sub {
    ok exists(&Hydrogen::ArrayRef::unshift), 'function exists';
    ok $EXPORTS{'unshift'}, 'function is importable';
    my $exception = dies {
        my $testarrayref = [ 'foo' ];
        Hydrogen::ArrayRef::unshift( $testarrayref, 'bar', 'baz' );
        is( $testarrayref, [ 'bar', 'baz', 'foo' ], q{$testarrayref deep match} );
    };
    is $exception, undef, 'no exception thrown running unshift example';
};

done_testing; # :)
