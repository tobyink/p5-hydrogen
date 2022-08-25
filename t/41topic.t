=pod

=encoding utf-8

=head1 PURPOSE

Proof of concept test for topicalized functions.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2022 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.


=cut

use strict;
use warnings;
use Test::More;

use_ok('Hydrogen::Topic::String');

$_ = 'xxx';
my $appender = \&Hydrogen::Topic::String::append;

$appender->( 'foo' );
$appender->( 'bar' );
$appender->( 'baz' );

is $_, 'xxxfoobarbaz', 'append worked!';

done_testing;
