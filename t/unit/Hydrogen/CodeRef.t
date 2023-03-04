# This file was autogenerated.

=head1 NAME

t/unit/Hydrogen/CodeRef.t - unit tests for Hydrogen::CodeRef

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
use Test2::V0 -target => "Hydrogen::CodeRef";

isa_ok( 'Hydrogen::CodeRef', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::CodeRef::EXPORT_OK;

subtest 'execute' => sub {
    ok exists(&Hydrogen::CodeRef::execute), 'function exists';
    ok $EXPORTS{'execute'}, 'function is importable';
    my $exception = dies {
        my $coderef = sub { 'code' };
        my $testcoderef = $coderef;
        
        # Calls: $coderef->( 1, 2, 3 )
        Hydrogen::CodeRef::execute( $testcoderef, 1, 2, 3 );
    };
    is $exception, undef, 'no exception thrown running execute example';
};

subtest 'execute_list' => sub {
    ok exists(&Hydrogen::CodeRef::execute_list), 'function exists';
    ok $EXPORTS{'execute_list'}, 'function is importable';
    my $exception = dies {
        my $context;
        my $coderef = sub { $context = wantarray(); 'code' };
        my $testcoderef = $coderef;
        
        # Calls: $coderef->( 1, 2, 3 )
        my $result = Hydrogen::CodeRef::execute_list( $testcoderef, 1, 2, 3 );
        
        is( $result, [ 'code' ], q{$result deep match} );
        ok( $context, q{$context is true} );
    };
    is $exception, undef, 'no exception thrown running execute_list example';
};

subtest 'execute_scalar' => sub {
    ok exists(&Hydrogen::CodeRef::execute_scalar), 'function exists';
    ok $EXPORTS{'execute_scalar'}, 'function is importable';
    my $exception = dies {
        my $context;
        my $coderef = sub { $context = wantarray(); 'code' };
        my $testcoderef = $coderef;
        
        # Calls: $coderef->( 1, 2, 3 )
        my $result = Hydrogen::CodeRef::execute_scalar( $testcoderef, 1, 2, 3 );
        
        is( $result, 'code', q{$result is 'code'} );
        ok( !($context), q{$context is false} );
    };
    is $exception, undef, 'no exception thrown running execute_scalar example';
};

subtest 'execute_void' => sub {
    ok exists(&Hydrogen::CodeRef::execute_void), 'function exists';
    ok $EXPORTS{'execute_void'}, 'function is importable';
    my $exception = dies {
        my $context;
        my $coderef = sub { $context = wantarray(); 'code' };
        my $testcoderef = $coderef;
        
        # Calls: $coderef->( 1, 2, 3 )
        my $result = Hydrogen::CodeRef::execute_void( $testcoderef, 1, 2, 3 );
        
        is( $result, undef, q{$result is undef} );
        is( $context, undef, q{$context is undef} );
    };
    is $exception, undef, 'no exception thrown running execute_void example';
};

done_testing; # :)