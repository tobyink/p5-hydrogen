# This file was autogenerated.

=head1 NAME

t/unit/Hydrogen/Scalar.t - unit tests for Hydrogen::Scalar

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2022-2023 by Toby Inkster.

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
use Test2::V0 -target => "Hydrogen::Scalar";

isa_ok( 'Hydrogen::Scalar', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Scalar::EXPORT_OK;

subtest 'make_getter' => sub {
    ok exists(&Hydrogen::Scalar::make_getter), 'function exists';
    ok $EXPORTS{'make_getter'}, 'function is importable';
    my $exception = dies {
        my $testscalar = 10;
        my $getter = Hydrogen::Scalar::make_getter( $testscalar );
        $testscalar = 11 ;
        is( $getter->(), 11, q{$getter->() is 11} );
    };
    is $exception, undef, 'no exception thrown running make_getter example';
};

subtest 'make_setter' => sub {
    ok exists(&Hydrogen::Scalar::make_setter), 'function exists';
    ok $EXPORTS{'make_setter'}, 'function is importable';
    my $exception = dies {
        my $testscalar = 10;
        my $setter = Hydrogen::Scalar::make_setter( $testscalar );
        $setter->( 11 );
        is( $testscalar, 11, q{$testscalar is 11} );
    };
    is $exception, undef, 'no exception thrown running make_setter example';
};

done_testing; # :)