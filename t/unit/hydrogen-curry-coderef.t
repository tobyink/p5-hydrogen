# This file was autogenerated.

=head1 NAME

hydrogen-curry-coderef.t - unit tests for Hydrogen::Curry::CodeRef

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

use Hydrogen::Curry::CodeRef;

isa_ok( 'Hydrogen::Curry::CodeRef', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Curry::CodeRef::EXPORT_OK;

subtest 'curry_execute' => sub {
    ok exists(&Hydrogen::Curry::CodeRef::curry_execute), 'function exists';
    ok $EXPORTS{'curry_execute'}, 'function is importable';
    my $e = exception {
        my $curried = Hydrogen::Curry::CodeRef::curry_execute( sub {} );
        is ref( $curried ), 'CODE', 'function returns a coderef';
    };
    is $e, undef, 'no exception thrown running curry_execute';
};

done_testing; # :)
