# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();
use Hydrogen::HashRef ();

package Hydrogen::Curry::HashRef;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.015';

=head1 NAME

Hydrogen::Curry::HashRef - easily curry functions from Hydrogen::HashRef

=head1 VERSION

This documentation is for Hydrogen::Curry::HashRef 0.015,
which is based on Sub::HandlesVia::HandlerLibrary::Hash 0.037.

=cut

=head1 FUNCTIONS

Each function expects a reference to a hash as its only argument and returns a coderef.

=cut

use Exporter::Shiny qw(
    curry_accessor
    curry_all
    curry_clear
    curry_count
    curry_defined
    curry_delete
    curry_delete_where
    curry_elements
    curry_exists
    curry_for_each_key
    curry_for_each_pair
    curry_for_each_value
    curry_get
    curry_is_empty
    curry_keys
    curry_kv
    curry_reset
    curry_set
    curry_shallow_clone
    curry_sorted_keys
    curry_values
);

=head2 C<< curry_accessor( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::accessor >>.

=cut

sub curry_accessor {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_accessor: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_accessor: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::accessor( $$ref, @_ ) };
}

=head2 C<< curry_all( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::all >>.

=cut

sub curry_all {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_all: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_all: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::all( $$ref, @_ ) };
}

=head2 C<< curry_clear( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::clear >>.

=cut

sub curry_clear {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_clear: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_clear: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::clear( $$ref, @_ ) };
}

=head2 C<< curry_count( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::count >>.

=cut

sub curry_count {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_count: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_count: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::count( $$ref, @_ ) };
}

=head2 C<< curry_defined( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::defined >>.

=cut

sub curry_defined {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_defined: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_defined: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::defined( $$ref, @_ ) };
}

=head2 C<< curry_delete( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::delete >>.

=cut

sub curry_delete {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_delete: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_delete: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::delete( $$ref, @_ ) };
}

=head2 C<< curry_delete_where( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::delete_where >>.

=cut

sub curry_delete_where {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_delete_where: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_delete_where: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::delete_where( $$ref, @_ ) };
}

=head2 C<< curry_elements( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::elements >>.

=cut

sub curry_elements {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_elements: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_elements: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::elements( $$ref, @_ ) };
}

=head2 C<< curry_exists( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::exists >>.

=cut

sub curry_exists {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_exists: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_exists: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::exists( $$ref, @_ ) };
}

=head2 C<< curry_for_each_key( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::for_each_key >>.

=cut

sub curry_for_each_key {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_for_each_key: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_for_each_key: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::for_each_key( $$ref, @_ ) };
}

=head2 C<< curry_for_each_pair( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::for_each_pair >>.

=cut

sub curry_for_each_pair {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_for_each_pair: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_for_each_pair: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::for_each_pair( $$ref, @_ ) };
}

=head2 C<< curry_for_each_value( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::for_each_value >>.

=cut

sub curry_for_each_value {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_for_each_value: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_for_each_value: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::for_each_value( $$ref, @_ ) };
}

=head2 C<< curry_get( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::get >>.

=cut

sub curry_get {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_get: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_get: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::get( $$ref, @_ ) };
}

=head2 C<< curry_is_empty( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::is_empty >>.

=cut

sub curry_is_empty {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_is_empty: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_is_empty: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::is_empty( $$ref, @_ ) };
}

=head2 C<< curry_keys( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::keys >>.

=cut

sub curry_keys {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_keys: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_keys: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::keys( $$ref, @_ ) };
}

=head2 C<< curry_kv( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::kv >>.

=cut

sub curry_kv {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_kv: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_kv: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::kv( $$ref, @_ ) };
}

=head2 C<< curry_reset( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::reset >>.

=cut

sub curry_reset {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_reset: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_reset: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::reset( $$ref, @_ ) };
}

=head2 C<< curry_set( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::set >>.

=cut

sub curry_set {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_set: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_set: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::set( $$ref, @_ ) };
}

=head2 C<< curry_shallow_clone( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::shallow_clone >>.

=cut

sub curry_shallow_clone {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_shallow_clone: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_shallow_clone: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::shallow_clone( $$ref, @_ ) };
}

=head2 C<< curry_sorted_keys( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::sorted_keys >>.

=cut

sub curry_sorted_keys {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_sorted_keys: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_sorted_keys: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::sorted_keys( $$ref, @_ ) };
}

=head2 C<< curry_values( $hashref ) >>

Curry the first argument of C<< Hydrogen::HashRef::values >>.

=cut

sub curry_values {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_values: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'HASH')
        or Hydrogen::croak(
            "Type check failed in signature for curry_values: %s should be %s",
            "\\$_[0]", "HashRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::HashRef::values( $$ref, @_ ) };
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Curry::HashRef -all;

To import a particular function, use:

    use Hydrogen::Curry::HashRef 'curry_clear';

To rename functions:

    use Hydrogen::Curry::HashRef 'curry_clear' => { -as => 'myfunc' };

On Perl 5.37.2+, you can import lexically:

    use Hydrogen::Curry::HashRef -lexical, 'curry_clear';

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::HashRef>,
L<Hydrogen::Hash>,
L<Hydrogen::Topic::HashRef>,
L<Sub::HandlesVia::HandlerLibrary::Hash>,
L<Hash::Util>.

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

