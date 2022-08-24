#!/usr/bin/env perl

use 5.012;
use strict;
use warnings;

use FindBin qw( $Bin );
use lib "$Bin/../lib";

use Hydrogen::Dev;

my $dev = 'Hydrogen::Dev'->new;
$dev->write_modules;
$dev->write_tests;

exit( 0 );
