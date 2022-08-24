use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::CodeRef;

isa_ok( 'Hydrogen::CodeRef', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::CodeRef::EXPORT_OK;

subtest 'execute' => sub {
    ok exists(&Hydrogen::CodeRef::execute), 'function exists';
    ok $EXPORTS{'execute'}, 'function is importable';
    my $e = exception {
          my $coderef = sub { 'code' };
          my $testcode = $coderef;
          
          # $coderef->( 1, 2, 3 )
          Hydrogen::CodeRef::execute( $testcode, 1, 2, 3 );
    };
    is( $e, undef, 'no exception thrown running execute example' );
};

# :)
done_testing;
