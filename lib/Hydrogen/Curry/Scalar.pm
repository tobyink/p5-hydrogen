# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();
use Hydrogen::Scalar ();

package Hydrogen::Curry::Scalar;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.006';

=head1 NAME

Hydrogen::Curry::Scalar - easily curry functions from Hydrogen::Scalar

=cut

=head1 FUNCTIONS

Each function expects a scalar as its only argument and returns a coderef.

=cut

use Exporter::Shiny qw(
    curry_make_getter
    curry_make_setter
);

=head2 C<< curry_make_getter( $scalar ) >>

Curry the first argument of C<< Hydrogen::Scalar::make_getter >>.

=cut

sub curry_make_getter {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_make_getter: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (!!1)
        or Hydrogen::croak(
            "Type check failed in signature for curry_make_getter: %s should be %s",
            "\\$_[0]", "Any"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Scalar::make_getter( $$ref, @_ ) };
}

=head2 C<< curry_make_setter( $scalar ) >>

Curry the first argument of C<< Hydrogen::Scalar::make_setter >>.

=cut

sub curry_make_setter {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_make_setter: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (!!1)
        or Hydrogen::croak(
            "Type check failed in signature for curry_make_setter: %s should be %s",
            "\\$_[0]", "Any"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Scalar::make_setter( $$ref, @_ ) };
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use Hydrogen::Curry::Scalar -all;

To import a particular function, use:

    use Hydrogen::Curry::Scalar 'curry_make_getter';

To rename functions:

    use Hydrogen::Curry::Scalar 'curry_make_getter' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Scalar>,
L<Sub::HandlesVia::HandlerLibrary::Scalar>.

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


