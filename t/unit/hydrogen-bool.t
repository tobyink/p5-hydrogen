# This file was autogenerated.

=head1 NAME

hydrogen-bool.t - unit tests for Hydrogen::Bool

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
use Test2::V0 -target => "Hydrogen::Bool";

isa_ok( 'Hydrogen::Bool', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Bool::EXPORT_OK;

subtest 'not' => sub {
    ok exists(&Hydrogen::Bool::not), 'function exists';
    ok $EXPORTS{'not'}, 'function is importable';
    my $exception = dies {
        my $testbool = 1;
        ok( !(Hydrogen::Bool::not( $testbool )), q{Hydrogen::Bool::not( $testbool ) is false} );
    };
    is $exception, undef, 'no exception thrown running not example';
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::Bool::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::Bool::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $exception = dies {
        my $testbool = !!0;
        Hydrogen::Bool::set( $testbool );
        ok( $testbool, q{$testbool is true} );
    };
    is $exception, undef, 'no exception thrown running set example';
};

subtest 'toggle' => sub {
    ok exists(&Hydrogen::Bool::toggle), 'function exists';
    ok $EXPORTS{'toggle'}, 'function is importable';
    my $exception = dies {
        my $testbool = !!0;
        Hydrogen::Bool::toggle( $testbool );
        ok( $testbool, q{$testbool is true} );
        Hydrogen::Bool::toggle( $testbool );
        ok( !($testbool), q{$testbool is false} );
    };
    is $exception, undef, 'no exception thrown running toggle example';
};

subtest 'unset' => sub {
    ok exists(&Hydrogen::Bool::unset), 'function exists';
    ok $EXPORTS{'unset'}, 'function is importable';
    my $exception = dies {
        my $testbool = !!0;
        Hydrogen::Bool::unset( $testbool );
        ok( !($testbool), q{$testbool is false} );
    };
    is $exception, undef, 'no exception thrown running unset example';
};

done_testing; # :)
