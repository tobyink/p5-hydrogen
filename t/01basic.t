=pod

=encoding utf-8

=head1 PURPOSE

Test that Hydrogen compiles.

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

use_ok('Hydrogen');

use_ok( "Hydrogen::$_" )
	for qw(
		Array     ArrayRef
		Bool
		Code      CodeRef
		Counter
		Hash      HashRef
		Number
		Scalar
		String
	);

done_testing;

