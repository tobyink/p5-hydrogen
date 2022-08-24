# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();
use Hydrogen::Counter ();

package Hydrogen::Curry::Counter;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.001';

=head1 NAME

Hydrogen::Curry::Counter - easily curry functions from Hydrogen::Counter

=cut

=head1 FUNCTIONS

Each function expects an integer as its only argument and returns a coderef.

=cut

use Exporter::Shiny qw(
    curry_dec
    curry_inc
    curry_reset
    curry_set
);

=head2 C<< Hydrogen::Curry::Counter::curry_dec( $counter ) >>

Curry the first argument of C<< Hydrogen::Counter::dec >>.

=cut

sub curry_dec {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_dec: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { my $tmp = $_[0]; defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/ })
        or Hydrogen::croak(
            "Type check failed in signature for curry_dec: %s should be %s",
            "\\$_[0]", "Int"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Counter::dec( $$ref, @_ ) };
}

=head2 C<< Hydrogen::Curry::Counter::curry_inc( $counter ) >>

Curry the first argument of C<< Hydrogen::Counter::inc >>.

=cut

sub curry_inc {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_inc: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { my $tmp = $_[0]; defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/ })
        or Hydrogen::croak(
            "Type check failed in signature for curry_inc: %s should be %s",
            "\\$_[0]", "Int"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Counter::inc( $$ref, @_ ) };
}

=head2 C<< Hydrogen::Curry::Counter::curry_reset( $counter ) >>

Curry the first argument of C<< Hydrogen::Counter::reset >>.

=cut

sub curry_reset {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_reset: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { my $tmp = $_[0]; defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/ })
        or Hydrogen::croak(
            "Type check failed in signature for curry_reset: %s should be %s",
            "\\$_[0]", "Int"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Counter::reset( $$ref, @_ ) };
}

=head2 C<< Hydrogen::Curry::Counter::curry_set( $counter ) >>

Curry the first argument of C<< Hydrogen::Counter::set >>.

=cut

sub curry_set {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_set: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { my $tmp = $_[0]; defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/ })
        or Hydrogen::croak(
            "Type check failed in signature for curry_set: %s should be %s",
            "\\$_[0]", "Int"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Counter::set( $$ref, @_ ) };
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use Hydrogen::Curry::Counter -all;

To import a particular function, use:

    use Hydrogen::Curry::Counter 'curry_reset';

To rename functions:

    use Hydrogen::Curry::Counter 'curry_reset' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Counter>,
L<Sub::HandlesVia::HandlerLibrary::Counter>.

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

