# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();
use Hydrogen::String ();

package Hydrogen::Curry::String;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.015';

=head1 NAME

Hydrogen::Curry::String - easily curry functions from Hydrogen::String

=head1 VERSION

This documentation is for Hydrogen::Curry::String 0.015,
which is based on Sub::HandlesVia::HandlerLibrary::String 0.037.

=cut

=head1 FUNCTIONS

Each function expects a string scalar as its only argument and returns a coderef.

=cut

use Exporter::Shiny qw(
    curry_append
    curry_chomp
    curry_chop
    curry_clear
    curry_cmp
    curry_cmpi
    curry_contains
    curry_contains_i
    curry_ends_with
    curry_ends_with_i
    curry_eq
    curry_eqi
    curry_fc
    curry_ge
    curry_gei
    curry_get
    curry_gt
    curry_gti
    curry_inc
    curry_lc
    curry_le
    curry_lei
    curry_length
    curry_lt
    curry_lti
    curry_match
    curry_match_i
    curry_ne
    curry_nei
    curry_prepend
    curry_replace
    curry_replace_globally
    curry_reset
    curry_set
    curry_starts_with
    curry_starts_with_i
    curry_substr
    curry_uc
);

=head2 C<< curry_append( $string ) >>

Curry the first argument of C<< Hydrogen::String::append >>.

=cut

sub curry_append {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_append: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_append: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::append( $$ref, @_ ) };
}

=head2 C<< curry_chomp( $string ) >>

Curry the first argument of C<< Hydrogen::String::chomp >>.

=cut

sub curry_chomp {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_chomp: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_chomp: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::chomp( $$ref, @_ ) };
}

=head2 C<< curry_chop( $string ) >>

Curry the first argument of C<< Hydrogen::String::chop >>.

=cut

sub curry_chop {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_chop: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_chop: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::chop( $$ref, @_ ) };
}

=head2 C<< curry_clear( $string ) >>

Curry the first argument of C<< Hydrogen::String::clear >>.

=cut

sub curry_clear {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_clear: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_clear: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::clear( $$ref, @_ ) };
}

=head2 C<< curry_cmp( $string ) >>

Curry the first argument of C<< Hydrogen::String::cmp >>.

=cut

sub curry_cmp {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_cmp: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_cmp: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::cmp( $$ref, @_ ) };
}

=head2 C<< curry_cmpi( $string ) >>

Curry the first argument of C<< Hydrogen::String::cmpi >>.

=cut

sub curry_cmpi {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_cmpi: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_cmpi: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::cmpi( $$ref, @_ ) };
}

=head2 C<< curry_contains( $string ) >>

Curry the first argument of C<< Hydrogen::String::contains >>.

=cut

sub curry_contains {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_contains: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_contains: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::contains( $$ref, @_ ) };
}

=head2 C<< curry_contains_i( $string ) >>

Curry the first argument of C<< Hydrogen::String::contains_i >>.

=cut

sub curry_contains_i {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_contains_i: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_contains_i: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::contains_i( $$ref, @_ ) };
}

=head2 C<< curry_ends_with( $string ) >>

Curry the first argument of C<< Hydrogen::String::ends_with >>.

=cut

sub curry_ends_with {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_ends_with: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_ends_with: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::ends_with( $$ref, @_ ) };
}

=head2 C<< curry_ends_with_i( $string ) >>

Curry the first argument of C<< Hydrogen::String::ends_with_i >>.

=cut

sub curry_ends_with_i {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_ends_with_i: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_ends_with_i: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::ends_with_i( $$ref, @_ ) };
}

=head2 C<< curry_eq( $string ) >>

Curry the first argument of C<< Hydrogen::String::eq >>.

=cut

sub curry_eq {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_eq: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_eq: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::eq( $$ref, @_ ) };
}

=head2 C<< curry_eqi( $string ) >>

Curry the first argument of C<< Hydrogen::String::eqi >>.

=cut

sub curry_eqi {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_eqi: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_eqi: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::eqi( $$ref, @_ ) };
}

=head2 C<< curry_fc( $string ) >>

Curry the first argument of C<< Hydrogen::String::fc >>.

=cut

sub curry_fc {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_fc: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_fc: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::fc( $$ref, @_ ) };
}

=head2 C<< curry_ge( $string ) >>

Curry the first argument of C<< Hydrogen::String::ge >>.

=cut

sub curry_ge {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_ge: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_ge: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::ge( $$ref, @_ ) };
}

=head2 C<< curry_gei( $string ) >>

Curry the first argument of C<< Hydrogen::String::gei >>.

=cut

sub curry_gei {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_gei: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_gei: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::gei( $$ref, @_ ) };
}

=head2 C<< curry_get( $string ) >>

Curry the first argument of C<< Hydrogen::String::get >>.

=cut

sub curry_get {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_get: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_get: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::get( $$ref, @_ ) };
}

=head2 C<< curry_gt( $string ) >>

Curry the first argument of C<< Hydrogen::String::gt >>.

=cut

sub curry_gt {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_gt: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_gt: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::gt( $$ref, @_ ) };
}

=head2 C<< curry_gti( $string ) >>

Curry the first argument of C<< Hydrogen::String::gti >>.

=cut

sub curry_gti {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_gti: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_gti: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::gti( $$ref, @_ ) };
}

=head2 C<< curry_inc( $string ) >>

Curry the first argument of C<< Hydrogen::String::inc >>.

=cut

sub curry_inc {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_inc: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_inc: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::inc( $$ref, @_ ) };
}

=head2 C<< curry_lc( $string ) >>

Curry the first argument of C<< Hydrogen::String::lc >>.

=cut

sub curry_lc {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_lc: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_lc: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::lc( $$ref, @_ ) };
}

=head2 C<< curry_le( $string ) >>

Curry the first argument of C<< Hydrogen::String::le >>.

=cut

sub curry_le {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_le: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_le: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::le( $$ref, @_ ) };
}

=head2 C<< curry_lei( $string ) >>

Curry the first argument of C<< Hydrogen::String::lei >>.

=cut

sub curry_lei {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_lei: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_lei: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::lei( $$ref, @_ ) };
}

=head2 C<< curry_length( $string ) >>

Curry the first argument of C<< Hydrogen::String::length >>.

=cut

sub curry_length {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_length: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_length: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::length( $$ref, @_ ) };
}

=head2 C<< curry_lt( $string ) >>

Curry the first argument of C<< Hydrogen::String::lt >>.

=cut

sub curry_lt {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_lt: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_lt: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::lt( $$ref, @_ ) };
}

=head2 C<< curry_lti( $string ) >>

Curry the first argument of C<< Hydrogen::String::lti >>.

=cut

sub curry_lti {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_lti: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_lti: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::lti( $$ref, @_ ) };
}

=head2 C<< curry_match( $string ) >>

Curry the first argument of C<< Hydrogen::String::match >>.

=cut

sub curry_match {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_match: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_match: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::match( $$ref, @_ ) };
}

=head2 C<< curry_match_i( $string ) >>

Curry the first argument of C<< Hydrogen::String::match_i >>.

=cut

sub curry_match_i {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_match_i: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_match_i: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::match_i( $$ref, @_ ) };
}

=head2 C<< curry_ne( $string ) >>

Curry the first argument of C<< Hydrogen::String::ne >>.

=cut

sub curry_ne {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_ne: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_ne: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::ne( $$ref, @_ ) };
}

=head2 C<< curry_nei( $string ) >>

Curry the first argument of C<< Hydrogen::String::nei >>.

=cut

sub curry_nei {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_nei: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_nei: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::nei( $$ref, @_ ) };
}

=head2 C<< curry_prepend( $string ) >>

Curry the first argument of C<< Hydrogen::String::prepend >>.

=cut

sub curry_prepend {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_prepend: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_prepend: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::prepend( $$ref, @_ ) };
}

=head2 C<< curry_replace( $string ) >>

Curry the first argument of C<< Hydrogen::String::replace >>.

=cut

sub curry_replace {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_replace: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_replace: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::replace( $$ref, @_ ) };
}

=head2 C<< curry_replace_globally( $string ) >>

Curry the first argument of C<< Hydrogen::String::replace_globally >>.

=cut

sub curry_replace_globally {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_replace_globally: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_replace_globally: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::replace_globally( $$ref, @_ ) };
}

=head2 C<< curry_reset( $string ) >>

Curry the first argument of C<< Hydrogen::String::reset >>.

=cut

sub curry_reset {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_reset: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_reset: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::reset( $$ref, @_ ) };
}

=head2 C<< curry_set( $string ) >>

Curry the first argument of C<< Hydrogen::String::set >>.

=cut

sub curry_set {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_set: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_set: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::set( $$ref, @_ ) };
}

=head2 C<< curry_starts_with( $string ) >>

Curry the first argument of C<< Hydrogen::String::starts_with >>.

=cut

sub curry_starts_with {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_starts_with: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_starts_with: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::starts_with( $$ref, @_ ) };
}

=head2 C<< curry_starts_with_i( $string ) >>

Curry the first argument of C<< Hydrogen::String::starts_with_i >>.

=cut

sub curry_starts_with_i {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_starts_with_i: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_starts_with_i: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::starts_with_i( $$ref, @_ ) };
}

=head2 C<< curry_substr( $string ) >>

Curry the first argument of C<< Hydrogen::String::substr >>.

=cut

sub curry_substr {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_substr: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_substr: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::substr( $$ref, @_ ) };
}

=head2 C<< curry_uc( $string ) >>

Curry the first argument of C<< Hydrogen::String::uc >>.

=cut

sub curry_uc {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_uc: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    do { package Hydrogen::String::__SANDBOX__; defined($_[0]) and do { ref(\$_[0]) eq 'SCALAR' or ref(\(my $val = $_[0])) eq 'SCALAR' } }
        or Hydrogen::croak(
            "Type check failed in signature for curry_uc: %s should be %s",
            "\\$_[0]", "Str"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::String::uc( $$ref, @_ ) };
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Curry::String -all;

To import a particular function, use:

    use Hydrogen::Curry::String 'curry_chop';

To rename functions:

    use Hydrogen::Curry::String 'curry_chop' => { -as => 'myfunc' };

On Perl 5.37.2+, you can import lexically:

    use Hydrogen::Curry::String -lexical, 'curry_chop';

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::String>,
L<Hydrogen::Topic::String>,
L<Sub::HandlesVia::HandlerLibrary::String>.

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

