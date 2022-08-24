use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::String;

isa_ok( 'Hydrogen::String', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::String::EXPORT_OK;

subtest 'append' => sub {
    ok exists(&Hydrogen::String::append), 'function exists';
    ok $EXPORTS{'append'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          Hydrogen::String::append( $teststring, 'bar' );
          is( $teststring, 'foobar', q{$teststring is 'foobar'} );
    };
    is( $e, undef, 'no exception thrown running append example' );
};

subtest 'chomp' => sub {
    ok exists(&Hydrogen::String::chomp), 'function exists';
    ok $EXPORTS{'chomp'}, 'function is importable';
};

subtest 'chop' => sub {
    ok exists(&Hydrogen::String::chop), 'function exists';
    ok $EXPORTS{'chop'}, 'function is importable';
};

subtest 'clear' => sub {
    ok exists(&Hydrogen::String::clear), 'function exists';
    ok $EXPORTS{'clear'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          Hydrogen::String::clear( $teststring );
          note $teststring; ## nothing
    };
    is( $e, undef, 'no exception thrown running clear example' );
};

subtest 'cmp' => sub {
    ok exists(&Hydrogen::String::cmp), 'function exists';
    ok $EXPORTS{'cmp'}, 'function is importable';
};

subtest 'cmpi' => sub {
    ok exists(&Hydrogen::String::cmpi), 'function exists';
    ok $EXPORTS{'cmpi'}, 'function is importable';
};

subtest 'contains' => sub {
    ok exists(&Hydrogen::String::contains), 'function exists';
    ok $EXPORTS{'contains'}, 'function is importable';
};

subtest 'contains_i' => sub {
    ok exists(&Hydrogen::String::contains_i), 'function exists';
    ok $EXPORTS{'contains_i'}, 'function is importable';
};

subtest 'ends_with' => sub {
    ok exists(&Hydrogen::String::ends_with), 'function exists';
    ok $EXPORTS{'ends_with'}, 'function is importable';
};

subtest 'ends_with_i' => sub {
    ok exists(&Hydrogen::String::ends_with_i), 'function exists';
    ok $EXPORTS{'ends_with_i'}, 'function is importable';
};

subtest 'eq' => sub {
    ok exists(&Hydrogen::String::eq), 'function exists';
    ok $EXPORTS{'eq'}, 'function is importable';
};

subtest 'eqi' => sub {
    ok exists(&Hydrogen::String::eqi), 'function exists';
    ok $EXPORTS{'eqi'}, 'function is importable';
};

subtest 'fc' => sub {
    ok exists(&Hydrogen::String::fc), 'function exists';
    ok $EXPORTS{'fc'}, 'function is importable';
};

subtest 'ge' => sub {
    ok exists(&Hydrogen::String::ge), 'function exists';
    ok $EXPORTS{'ge'}, 'function is importable';
};

subtest 'gei' => sub {
    ok exists(&Hydrogen::String::gei), 'function exists';
    ok $EXPORTS{'gei'}, 'function is importable';
};

subtest 'get' => sub {
    ok exists(&Hydrogen::String::get), 'function exists';
    ok $EXPORTS{'get'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          is( Hydrogen::String::get( $teststring ), 'foo', q{Hydrogen::String::get( $teststring ) is 'foo'} );
    };
    is( $e, undef, 'no exception thrown running get example' );
};

subtest 'gt' => sub {
    ok exists(&Hydrogen::String::gt), 'function exists';
    ok $EXPORTS{'gt'}, 'function is importable';
};

subtest 'gti' => sub {
    ok exists(&Hydrogen::String::gti), 'function exists';
    ok $EXPORTS{'gti'}, 'function is importable';
};

subtest 'inc' => sub {
    ok exists(&Hydrogen::String::inc), 'function exists';
    ok $EXPORTS{'inc'}, 'function is importable';
};

subtest 'lc' => sub {
    ok exists(&Hydrogen::String::lc), 'function exists';
    ok $EXPORTS{'lc'}, 'function is importable';
};

subtest 'le' => sub {
    ok exists(&Hydrogen::String::le), 'function exists';
    ok $EXPORTS{'le'}, 'function is importable';
};

subtest 'lei' => sub {
    ok exists(&Hydrogen::String::lei), 'function exists';
    ok $EXPORTS{'lei'}, 'function is importable';
};

subtest 'length' => sub {
    ok exists(&Hydrogen::String::length), 'function exists';
    ok $EXPORTS{'length'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          is( Hydrogen::String::length( $teststring ), 3, q{Hydrogen::String::length( $teststring ) is 3} );
    };
    is( $e, undef, 'no exception thrown running length example' );
};

subtest 'lt' => sub {
    ok exists(&Hydrogen::String::lt), 'function exists';
    ok $EXPORTS{'lt'}, 'function is importable';
};

subtest 'lti' => sub {
    ok exists(&Hydrogen::String::lti), 'function exists';
    ok $EXPORTS{'lti'}, 'function is importable';
};

subtest 'match' => sub {
    ok exists(&Hydrogen::String::match), 'function exists';
    ok $EXPORTS{'match'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          if ( Hydrogen::String::match( $teststring, '^f..$' ) ) {
            note 'matched!';
          }
    };
    is( $e, undef, 'no exception thrown running match example' );
};

subtest 'match_i' => sub {
    ok exists(&Hydrogen::String::match_i), 'function exists';
    ok $EXPORTS{'match_i'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          if ( Hydrogen::String::match_i( $teststring, '^F..$' ) ) {
            note 'matched!';
          }
    };
    is( $e, undef, 'no exception thrown running match_i example' );
};

subtest 'ne' => sub {
    ok exists(&Hydrogen::String::ne), 'function exists';
    ok $EXPORTS{'ne'}, 'function is importable';
};

subtest 'nei' => sub {
    ok exists(&Hydrogen::String::nei), 'function exists';
    ok $EXPORTS{'nei'}, 'function is importable';
};

subtest 'prepend' => sub {
    ok exists(&Hydrogen::String::prepend), 'function exists';
    ok $EXPORTS{'prepend'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          Hydrogen::String::prepend( $teststring, 'bar' );
          is( $teststring, 'barfoo', q{$teststring is 'barfoo'} );
    };
    is( $e, undef, 'no exception thrown running prepend example' );
};

subtest 'replace' => sub {
    ok exists(&Hydrogen::String::replace), 'function exists';
    ok $EXPORTS{'replace'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          Hydrogen::String::replace( $teststring, 'o' => 'a' );
          is( $teststring, 'fao', q{$teststring is 'fao'} );
        
          my $teststring2 = 'foo';
          Hydrogen::String::replace( $teststring2, qr/O/i => sub { return 'e' } );
          is( $teststring2, 'feo', q{$teststring2 is 'feo'} );
    };
    is( $e, undef, 'no exception thrown running replace example' );
};

subtest 'replace_globally' => sub {
    ok exists(&Hydrogen::String::replace_globally), 'function exists';
    ok $EXPORTS{'replace_globally'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          Hydrogen::String::replace_globally( $teststring, 'o' => 'a' );
          is( $teststring, 'faa', q{$teststring is 'faa'} );
        
          my $teststring2 = 'foo';
          Hydrogen::String::replace_globally( $teststring2, qr/O/i => sub { return 'e' } );
          is( $teststring2, 'fee', q{$teststring2 is 'fee'} );
    };
    is( $e, undef, 'no exception thrown running replace_globally example' );
};

subtest 'reset' => sub {
    ok exists(&Hydrogen::String::reset), 'function exists';
    ok $EXPORTS{'reset'}, 'function is importable';
};

subtest 'set' => sub {
    ok exists(&Hydrogen::String::set), 'function exists';
    ok $EXPORTS{'set'}, 'function is importable';
    my $e = exception {
          my $teststring = 'foo';
          Hydrogen::String::set( $teststring, 'bar' );
          is( $teststring, 'bar', q{$teststring is 'bar'} );
    };
    is( $e, undef, 'no exception thrown running set example' );
};

subtest 'starts_with' => sub {
    ok exists(&Hydrogen::String::starts_with), 'function exists';
    ok $EXPORTS{'starts_with'}, 'function is importable';
};

subtest 'starts_with_i' => sub {
    ok exists(&Hydrogen::String::starts_with_i), 'function exists';
    ok $EXPORTS{'starts_with_i'}, 'function is importable';
};

subtest 'substr' => sub {
    ok exists(&Hydrogen::String::substr), 'function exists';
    ok $EXPORTS{'substr'}, 'function is importable';
};

subtest 'uc' => sub {
    ok exists(&Hydrogen::String::uc), 'function exists';
    ok $EXPORTS{'uc'}, 'function is importable';
};

# :)
done_testing;
