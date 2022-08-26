# This file was autogenerated.

=head1 NAME

hydrogen-topic-coderef.t - unit tests for Hydrogen::Topic::CodeRef

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
use Test2::V0 -target => "Hydrogen::Topic::CodeRef";

isa_ok( 'Hydrogen::Topic::CodeRef', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Topic::CodeRef::EXPORT_OK;

subtest 'execute' => sub {
    ok exists(&Hydrogen::Topic::CodeRef::execute), 'function exists';
    ok $EXPORTS{'execute'}, 'function is importable';
    my $exception = dies {
        local $_;
        my $coderef = sub { 'code' };
        $_ = $coderef;
        
        # $coderef->( 1, 2, 3 )
        Hydrogen::Topic::CodeRef::execute( 1, 2, 3 );
    };
    is $exception, undef, 'no exception thrown running execute example';
};

done_testing; # :)
