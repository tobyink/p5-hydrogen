use 5.008008;
use strict;
use warnings;

use Test::More 0.96;
use Test::Fatal;

use Hydrogen::Code;

isa_ok( 'Hydrogen::Code', 'Exporter::Tiny' );

my %EXPORTS = map +( $_ => 1 ), @Hydrogen::Code::EXPORT_OK;

subtest 'execute' => sub {
    ok exists(&Hydrogen::Code::execute), 'function exists';
    ok $EXPORTS{'execute'}, 'function is importable';
};

# :)
done_testing;
