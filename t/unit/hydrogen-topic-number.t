# This file was autogenerated.

=head1 NAME

hydrogen-topic-number.t - unit tests for Hydrogen::Topic::Number

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

use Hydrogen::Topic::Number;

isa_ok( 'Hydrogen::Topic::Number', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Topic::Number::EXPORT_OK;

subtest 'abs' => sub {
    ok exists(&Hydrogen::Topic::Number::abs), 'function exists';
    ok $EXPORTS{'abs'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = -5;
        Hydrogen::Topic::Number::abs();
        is( $_, 5, q{$_ is 5} );
    };
    is $e, undef, 'no exception thrown running abs example';
};

subtest 'add' => sub {
    ok exists(&Hydrogen::Topic::Number::add), 'function exists';
    ok $EXPORTS{'add'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 4;
        Hydrogen::Topic::Number::add( 5 );
        is( $_, 9, q{$_ is 9} );
    };
    is $e, undef, 'no exception thrown running add example';
};

subtest 'cmp' => sub {
    ok exists(&Hydrogen::Topic::Number::cmp), 'function exists';
    ok $EXPORTS{'cmp'}, 'function is importable';
};

subtest 'div' => sub {
    ok exists(&Hydrogen::Topic::Number::div), 'function exists';
    ok $EXPORTS{'div'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 6;
        Hydrogen::Topic::Number::div( 2 );
        is( $_, 3, q{$_ is 3} );
    };
    is $e, undef, 'no exception thrown running div example';
};

subtest 'eq' => sub {
    ok exists(&Hydrogen::Topic::Number::eq), 'function exists';
    ok $EXPORTS{'eq'}, 'function is importable';
};

subtest 'ge' => sub {
    ok exists(&Hydrogen::Topic::Number::ge), 'function exists';
    ok $EXPORTS{'ge'}, 'function is importable';
};

subtest 'get' => sub {
    ok exists(&Hydrogen::Topic::Number::get), 'function exists';
    ok $EXPORTS{'get'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 4;
        is( Hydrogen::Topic::Number::get(), 4, q{Hydrogen::Topic::Number::get() is 4} );
    };
    is $e, undef, 'no exception thrown running get example';
};

subtest 'gt' => sub {
    ok exists(&Hydrogen::Topic::Number::gt), 'function exists';
    ok $EXPORTS{'gt'}, 'function is importable';
};

subtest 'le' => sub {
    ok exists(&Hydrogen::Topic::Number::le), 'function exists';
    ok $EXPORTS{'le'}, 'function is importable';
};

subtest 'lt' => sub {
    ok exists(&Hydrogen::Topic::Number::lt), 'function exists';
    ok $EXPORTS{'lt'}, 'function is importable';
};

subtest 'mod' => sub {
    ok exists(&Hydrogen::Topic::Number::mod), 'function exists';
    ok $EXPORTS{'mod'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 5;
        Hydrogen::Topic::Number::mod( 2 );
        is( $_, 1, q{$_ is 1} );
    };
    is $e, undef, 'no exception thrown running mod example';
};

subtest 'mul' => sub {
    ok exists(&Hydrogen::Topic::Number::mul), 'function exists';
    ok $EXPORTS{'mul'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 2;
        Hydrogen::Topic::Number::mul( 5 );
        is( $_, 10, q{$_ is 10} );
    };
    is $e, undef, 'no exception thrown running mul example';
};

subtest 'ne' => sub {
    ok exists(&Hydrogen::Topic::Number::ne), 'function exists';
    ok $EXPORTS{'ne'}, 'function is importable';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::Topic::Number::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 4;
        Hydrogen::Topic::Number::set( 5 );
        is( $_, 5, q{$_ is 5} );
    };
    is $e, undef, 'no exception thrown running set example';
};

subtest 'sub' => sub {
    ok exists(&Hydrogen::Topic::Number::sub), 'function exists';
    ok $EXPORTS{'sub'}, 'function is importable';
    my $e = exception {
        local $_;
        $_ = 9;
        Hydrogen::Topic::Number::sub( 6 );
        is( $_, 3, q{$_ is 3} );
    };
    is $e, undef, 'no exception thrown running sub example';
};

# :)
done_testing;
