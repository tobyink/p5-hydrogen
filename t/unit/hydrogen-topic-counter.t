# This file was autogenerated.

=head1 NAME

hydrogen-topic-counter.t - unit tests for Hydrogen::Topic::Counter

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
use Test2::V0 -target => "Hydrogen::Topic::Counter";

isa_ok( 'Hydrogen::Topic::Counter', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Topic::Counter::EXPORT_OK;

subtest 'dec' => sub {
    ok exists(&Hydrogen::Topic::Counter::dec), 'function exists';
    ok $EXPORTS{'dec'}, 'function is importable';
    my $exception = dies {
        local $_;
        $_ = 10;
        Hydrogen::Topic::Counter::dec();
        Hydrogen::Topic::Counter::dec();
        is( $_, 8, q{$_ is 8} );
        Hydrogen::Topic::Counter::dec( 5 );
        is( $_, 3, q{$_ is 3} );
    };
    is $exception, undef, 'no exception thrown running dec example';
};

subtest 'inc' => sub {
    ok exists(&Hydrogen::Topic::Counter::inc), 'function exists';
    ok $EXPORTS{'inc'}, 'function is importable';
    my $exception = dies {
        local $_;
        $_ = 0;
        Hydrogen::Topic::Counter::inc();
        Hydrogen::Topic::Counter::inc();
        is( $_, 2, q{$_ is 2} );
        Hydrogen::Topic::Counter::inc( 3 );
        is( $_, 5, q{$_ is 5} );
    };
    is $exception, undef, 'no exception thrown running inc example';
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::Topic::Counter::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
    my $exception = dies {
        local $_;
        $_ = 10;
        Hydrogen::Topic::Counter::reset();
        is( $_, 0, q{$_ is 0} );
    };
    is $exception, undef, 'no exception thrown running reset example';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::Topic::Counter::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $exception = dies {
        local $_;
        $_ = 0;
        Hydrogen::Topic::Counter::set( 5 );
        is( $_, 5, q{$_ is 5} );
    };
    is $exception, undef, 'no exception thrown running set example';
};

done_testing; # :)
