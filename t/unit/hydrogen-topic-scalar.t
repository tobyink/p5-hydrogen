# This file was autogenerated.

=head1 NAME

t/unit/hydrogen-topic-scalar.t - unit tests for Hydrogen::Topic::Scalar

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

use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Topic::Scalar;

isa_ok( 'Hydrogen::Topic::Scalar', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Topic::Scalar::EXPORT_OK;

subtest 'make_getter' => sub {
    ok exists(&Hydrogen::Topic::Scalar::make_getter), 'function exists';
    ok $EXPORTS{'make_getter'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 10;
        my $getter = Hydrogen::Topic::Scalar::make_getter();
        $_ = 11 ;
        is( $getter->(), 11, q{$getter->() is 11} );
    };
    is $e, undef, 'no exception thrown running make_getter example';
};

subtest 'make_setter' => sub {
    ok exists(&Hydrogen::Topic::Scalar::make_setter), 'function exists';
    ok $EXPORTS{'make_setter'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 10;
        my $setter = Hydrogen::Topic::Scalar::make_setter();
        $setter->( 11 );
        is( $_, 11, q{$_ is 11} );
    };
    is $e, undef, 'no exception thrown running make_setter example';
};

# :)
done_testing;
