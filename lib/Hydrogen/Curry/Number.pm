# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();
use Hydrogen::Number ();

package Hydrogen::Curry::Number;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.010';

=head1 NAME

Hydrogen::Curry::Number - easily curry functions from Hydrogen::Number

=head1 VERSION

This documentation is for Hydrogen::Curry::Number 0.010.

=cut

=head1 FUNCTIONS

Each function expects a numeric scalar as its only argument and returns a coderef.

=cut

use Exporter::Shiny qw(
    curry_abs
    curry_add
    curry_cmp
    curry_div
    curry_eq
    curry_ge
    curry_get
    curry_gt
    curry_le
    curry_lt
    curry_mod
    curry_mul
    curry_ne
    curry_set
    curry_sub
);

=head2 C<< curry_abs( $number ) >>

Curry the first argument of C<< Hydrogen::Number::abs >>.

=cut

sub curry_abs {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_abs: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_abs: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::abs( $$ref, @_ ) };
}

=head2 C<< curry_add( $number ) >>

Curry the first argument of C<< Hydrogen::Number::add >>.

=cut

sub curry_add {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_add: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_add: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::add( $$ref, @_ ) };
}

=head2 C<< curry_cmp( $number ) >>

Curry the first argument of C<< Hydrogen::Number::cmp >>.

=cut

sub curry_cmp {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_cmp: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_cmp: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::cmp( $$ref, @_ ) };
}

=head2 C<< curry_div( $number ) >>

Curry the first argument of C<< Hydrogen::Number::div >>.

=cut

sub curry_div {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_div: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_div: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::div( $$ref, @_ ) };
}

=head2 C<< curry_eq( $number ) >>

Curry the first argument of C<< Hydrogen::Number::eq >>.

=cut

sub curry_eq {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_eq: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_eq: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::eq( $$ref, @_ ) };
}

=head2 C<< curry_ge( $number ) >>

Curry the first argument of C<< Hydrogen::Number::ge >>.

=cut

sub curry_ge {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_ge: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_ge: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::ge( $$ref, @_ ) };
}

=head2 C<< curry_get( $number ) >>

Curry the first argument of C<< Hydrogen::Number::get >>.

=cut

sub curry_get {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_get: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_get: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::get( $$ref, @_ ) };
}

=head2 C<< curry_gt( $number ) >>

Curry the first argument of C<< Hydrogen::Number::gt >>.

=cut

sub curry_gt {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_gt: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_gt: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::gt( $$ref, @_ ) };
}

=head2 C<< curry_le( $number ) >>

Curry the first argument of C<< Hydrogen::Number::le >>.

=cut

sub curry_le {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_le: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_le: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::le( $$ref, @_ ) };
}

=head2 C<< curry_lt( $number ) >>

Curry the first argument of C<< Hydrogen::Number::lt >>.

=cut

sub curry_lt {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_lt: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_lt: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::lt( $$ref, @_ ) };
}

=head2 C<< curry_mod( $number ) >>

Curry the first argument of C<< Hydrogen::Number::mod >>.

=cut

sub curry_mod {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_mod: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_mod: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::mod( $$ref, @_ ) };
}

=head2 C<< curry_mul( $number ) >>

Curry the first argument of C<< Hydrogen::Number::mul >>.

=cut

sub curry_mul {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_mul: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_mul: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::mul( $$ref, @_ ) };
}

=head2 C<< curry_ne( $number ) >>

Curry the first argument of C<< Hydrogen::Number::ne >>.

=cut

sub curry_ne {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_ne: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_ne: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::ne( $$ref, @_ ) };
}

=head2 C<< curry_set( $number ) >>

Curry the first argument of C<< Hydrogen::Number::set >>.

=cut

sub curry_set {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_set: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_set: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::set( $$ref, @_ ) };
}

=head2 C<< curry_sub( $number ) >>

Curry the first argument of C<< Hydrogen::Number::sub >>.

=cut

sub curry_sub {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_sub: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (do { package Hydrogen::Number::__SANDBOX__; use Scalar::Util (); defined($_[0]) && !ref($_[0]) && Scalar::Util::looks_like_number($_[0]) })
        or Hydrogen::croak(
            "Type check failed in signature for curry_sub: %s should be %s",
            "\\$_[0]", "Num"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::Number::sub( $$ref, @_ ) };
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Curry::Number -all;

To import a particular function, use:

    use Hydrogen::Curry::Number 'curry_cmp';

To rename functions:

    use Hydrogen::Curry::Number 'curry_cmp' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Number>,
L<Hydrogen::Topic::Number>,
L<Sub::HandlesVia::HandlerLibrary::Number>.

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

