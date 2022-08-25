# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();
use Hydrogen::Bool ();

package Hydrogen::Curry::Bool;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.006';

=head1 NAME

Hydrogen::Curry::Bool - easily curry functions from Hydrogen::Bool

=head1 VERSION

This documentation is for Hydrogen::Curry::Bool 0.006.

=cut

=head1 FUNCTIONS

Each function expects a scalar which will be treated as a boolean as its only argument and returns a coderef.

=cut

use Exporter::Shiny qw(
    curry_not
    curry_reset
    curry_set
    curry_toggle
    curry_unset
);

=head2 C<< curry_not( $bool ) >>

Curry the first argument of C<< Hydrogen::Bool::not >>.

=cut

sub curry_not {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_not: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (!!1)
        or Hydrogen::croak(
            "Type check failed in signature for curry_not: %s should be %s",
            "\\$_[0]", "Any"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Bool::not( $$ref, @_ ) };
}

=head2 C<< curry_reset( $bool ) >>

Curry the first argument of C<< Hydrogen::Bool::reset >>.

=cut

sub curry_reset {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_reset: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (!!1)
        or Hydrogen::croak(
            "Type check failed in signature for curry_reset: %s should be %s",
            "\\$_[0]", "Any"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Bool::reset( $$ref, @_ ) };
}

=head2 C<< curry_set( $bool ) >>

Curry the first argument of C<< Hydrogen::Bool::set >>.

=cut

sub curry_set {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_set: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (!!1)
        or Hydrogen::croak(
            "Type check failed in signature for curry_set: %s should be %s",
            "\\$_[0]", "Any"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Bool::set( $$ref, @_ ) };
}

=head2 C<< curry_toggle( $bool ) >>

Curry the first argument of C<< Hydrogen::Bool::toggle >>.

=cut

sub curry_toggle {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_toggle: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (!!1)
        or Hydrogen::croak(
            "Type check failed in signature for curry_toggle: %s should be %s",
            "\\$_[0]", "Any"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Bool::toggle( $$ref, @_ ) };
}

=head2 C<< curry_unset( $bool ) >>

Curry the first argument of C<< Hydrogen::Bool::unset >>.

=cut

sub curry_unset {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_unset: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (!!1)
        or Hydrogen::croak(
            "Type check failed in signature for curry_unset: %s should be %s",
            "\\$_[0]", "Any"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Bool::unset( $$ref, @_ ) };
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use Hydrogen::Curry::Bool -all;

To import a particular function, use:

    use Hydrogen::Curry::Bool 'curry_set';

To rename functions:

    use Hydrogen::Curry::Bool 'curry_set' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Bool>,
L<Sub::HandlesVia::HandlerLibrary::Bool>.

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


