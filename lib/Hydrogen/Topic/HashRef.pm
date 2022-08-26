# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Topic::HashRef;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.010';

=head1 NAME

Hydrogen::Topic::HashRef - functions from Hydrogen::HashRef applied to C<$_>

=head1 VERSION

This documentation is for Hydrogen::Topic::HashRef 0.010.

=cut

=head1 FUNCTIONS

Each function implicitly operates on C<< $_ >>, expecting it to be a reference to a hash.

=cut

use Exporter::Shiny qw(
    accessor
    all
    clear
    count
    defined
    delete
    elements
    exists
    for_each_key
    for_each_pair
    for_each_value
    get
    is_empty
    keys
    kv
    reset
    set
    shallow_clone
    sorted_keys
    values
);

=head2 C<< accessor( $key, $value? ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Arguments: B<< Str >>, B<< Optional[Any] >>.

Acts like C<get> if given one argument, or C<set> if given two arguments.

=cut

{
    my $__signature;

    sub accessor {

        package Hydrogen::HashRef::__SANDBOX__;
        $__signature ||= sub {
            my ( %tmp, $tmp );

            @_ >= 1 && @_ <= 2
              or Hydrogen::croak(
                "Wrong number of parameters in signature for %s: got %d, %s",
                "accessor", scalar(@_), "expected exactly 1 parameters" );

            # Parameter $_[0] (type: Str)
            do {

                package Hydrogen::HashRef::__SANDBOX__;
                defined( $_[0] ) and do {
                    ref( \$_[0] ) eq 'SCALAR'
                      or ref( \( my $val = $_[0] ) ) eq 'SCALAR';
                }
              }
              or Hydrogen::croak(
                "Type check failed in signature for accessor: %s should be %s",
                "\$_[0]", "Str"
              );

            # Parameter $_[1] (type: Optional[Any])
            $#_ >= 1
              or return (@_);
            ( !!1 )
              or Hydrogen::croak(
                "Type check failed in signature for accessor: %s should be %s",
                "\$_[1]", "Optional[Any]"
              );

            (@_);
        };
        @_ = &$__signature;
        1;
        if ( ( 0 + @_ ) == 1 ) { ($_)->{ $_[0] } }
        else {
            my %shv_tmp = %{$_};
            $shv_tmp{ $_[0] } = $_[1];
            ( %{$_} = %{ +\%shv_tmp } );
        }
    }
}

=head2 C<< all() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns the hash in list context.

=cut

sub all {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for all; usage: "
          . "Hydrogen::Topic::HashRef::all()" );
    %{$_};
}

=head2 C<< clear() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Empties the hash.

=cut

sub clear {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for clear; usage: "
          . "Hydrogen::Topic::HashRef::clear()" );
    1;
    ( %{$_} = () );
}

=head2 C<< count() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns the number of keys in the hash.

=cut

sub count {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for count; usage: "
          . "Hydrogen::Topic::HashRef::count()" );
    scalar keys %{$_};
}

=head2 C<< defined( $key ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Arguments: B<< Str >>.

Indicates whether a value exists and is defined in the hashref by its key.

=cut

sub defined {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 1
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "defined", scalar(@_), "expected exactly 1 parameters" );

        # Parameter $_[0] (type: Str)
        do {

            package Hydrogen::HashRef::__SANDBOX__;
            defined( $_[0] ) and do {
                ref( \$_[0] ) eq 'SCALAR'
                  or ref( \( my $val = $_[0] ) ) eq 'SCALAR';
            }
          }
          or Hydrogen::croak(
            "Type check failed in signature for defined: %s should be %s",
            "\$_[0]", "Str" );

        (@_);
    };
    defined( ($_)->{ $_[0] } );
}

=head2 C<< delete( $key ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Removes a value from the hashref by its key.

=cut

sub delete {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ >= 1
      or Hydrogen::croak( "Wrong number of parameters for delete; usage: "
          . "Hydrogen::Topic::HashRef::delete( \$key )" );
    1;
    my %shv_tmp    = %{$_};
    my @shv_return = delete @shv_tmp{@_};
    ( %{$_} = %{ +\%shv_tmp } );
    wantarray ? @shv_return : $shv_return[-1];
}

=head2 C<< elements() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns the hash in list context.

=cut

sub elements {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for elements; usage: "
          . "Hydrogen::Topic::HashRef::elements()" );
    %{$_};
}

=head2 C<< exists( $key ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Arguments: B<< Str >>.

Indicates whether a value exists in the hashref by its key.

=cut

sub exists {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 1
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "exists", scalar(@_), "expected exactly 1 parameters" );

        # Parameter $_[0] (type: Str)
        do {

            package Hydrogen::HashRef::__SANDBOX__;
            defined( $_[0] ) and do {
                ref( \$_[0] ) eq 'SCALAR'
                  or ref( \( my $val = $_[0] ) ) eq 'SCALAR';
            }
          }
          or Hydrogen::croak(
            "Type check failed in signature for exists: %s should be %s",
            "\$_[0]", "Str" );

        (@_);
    };
    defined( ($_)->{ $_[0] } );
}

=head2 C<< for_each_key( $coderef ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Arguments: B<< CodeRef >>.

Function which calls the coderef for each key in the hash, passing just the key to the coderef.

=cut

sub for_each_key {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 1
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "for_each_key", scalar(@_), "expected exactly 1 parameters" );

        # Parameter $_[0] (type: CodeRef)
        ( ref( $_[0] ) eq 'CODE' )
          or Hydrogen::croak(
            "Type check failed in signature for for_each_key: %s should be %s",
            "\$_[0]", "CodeRef"
          );

        (@_);
    };
    for my $shv_key ( keys %{$_} ) { &{ $_[0] }($shv_key) };
    $_;
}

=head2 C<< for_each_pair( $coderef ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Arguments: B<< CodeRef >>.

Function which calls the coderef for each key in the hash, passing the key and value to the coderef.

=cut

sub for_each_pair {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 1
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "for_each_pair", scalar(@_), "expected exactly 1 parameters" );

        # Parameter $_[0] (type: CodeRef)
        ( ref( $_[0] ) eq 'CODE' )
          or Hydrogen::croak(
            "Type check failed in signature for for_each_pair: %s should be %s",
            "\$_[0]", "CodeRef"
          );

        (@_);
    };
    while ( my ( $shv_key, $shv_value ) = each %{$_} ) {
        &{ $_[0] }( $shv_key, $shv_value );
    };
    $_;
}

=head2 C<< for_each_value( $coderef ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Arguments: B<< CodeRef >>.

Function which calls the coderef for each value in the hash, passing just the value to the coderef.

=cut

sub for_each_value {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 1
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "for_each_value", scalar(@_), "expected exactly 1 parameters" );

        # Parameter $_[0] (type: CodeRef)
        ( ref( $_[0] ) eq 'CODE' )
          or Hydrogen::croak(
"Type check failed in signature for for_each_value: %s should be %s",
            "\$_[0]", "CodeRef"
          );

        (@_);
    };
    for my $shv_value ( values %{$_} ) { &{ $_[0] }($shv_value) };
    $_;
}

=head2 C<< get( $key ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns a value from the hashref by its key.

=cut

sub get {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ >= 1
      or Hydrogen::croak( "Wrong number of parameters for get; usage: "
          . "Hydrogen::Topic::HashRef::get( \$key )" );
    ( 0 + @_ ) > 1 ? @{$_}{@_} : ($_)->{ $_[0] };
}

=head2 C<< is_empty() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns true iff there are no keys in the hash.

=cut

sub is_empty {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for is_empty; usage: "
          . "Hydrogen::Topic::HashRef::is_empty()" );
    !scalar keys %{$_};
}

=head2 C<< keys() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns the list of keys in the hash.

=cut

sub keys {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for keys; usage: "
          . "Hydrogen::Topic::HashRef::keys()" );
    keys %{$_};
}

=head2 C<< kv() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns a list of arrayrefs, where each arrayref is a key-value pair.

=cut

sub kv {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for kv; usage: "
          . "Hydrogen::Topic::HashRef::kv()" );
    map [ $_ => ($_)->{$_} ], keys %{$_};
}

=head2 C<< reset() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Resets the original value to its default value, or an empty hashref if it has no default.

=cut

sub reset {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for reset; usage: "
          . "Hydrogen::Topic::HashRef::reset()" );
    (
        %{$_} = %{
            +do {
                my $shv_final_unchecked = {};
                do {
                    ( ref($shv_final_unchecked) eq 'HASH' )
                      or Hydrogen::croak(
"Type check failed for reset: expected %s, got value %s",
                        "HashRef", $shv_final_unchecked
                      );
                    $shv_final_unchecked;
                };
            }
        }
    );
}

=head2 C<< set( $key, $value, ... ) >>

Operates on C<< $_ >>, which must be a reference to a hash.

Given a key and value, adds the key to the hashref with the given value.

=cut

sub set {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ >= 2
      or Hydrogen::croak( "Wrong number of parameters for set; usage: "
          . "Hydrogen::Topic::HashRef::set( \$key, \$value, ... )" );
    my (@shv_params) = @_;
    scalar(@shv_params) % 2 and do {
        require Carp;
        Carp::croak(
"Wrong number of parameters; expected even-sized list of keys and values"
        );
    };
    my (@shv_keys_idx)   = grep( !( $_ % 2 ), 0 .. $#shv_params );
    my (@shv_values_idx) = grep( ( $_ % 2 ),  0 .. $#shv_params );
    grep( !defined, @shv_params[@shv_keys_idx] ) and do {
        require Carp;
        Carp::croak("Undef did not pass type constraint; keys must be defined");
    };
    for my $shv_tmp (@shv_keys_idx) {
        do {
            do {

                package Hydrogen::HashRef::__SANDBOX__;
                defined( $shv_params[$shv_tmp] ) and do {
                    ref( \$shv_params[$shv_tmp] ) eq 'SCALAR'
                      or ref( \( my $val = $shv_params[$shv_tmp] ) ) eq 'SCALAR';
                }
              }
              or Hydrogen::croak(
                "Type check failed for set: expected %s, got value %s",
                "Str", $shv_params[$shv_tmp] );
            $shv_params[$shv_tmp];
        };
    };
    my %shv_tmp = %{$_};
    @shv_tmp{ @shv_params[@shv_keys_idx] } = @shv_params[@shv_values_idx];
    ( %{$_} = %{ +\%shv_tmp } );
    wantarray
      ? @shv_tmp{ @shv_params[@shv_keys_idx] }
      : $shv_tmp{ $shv_params[ $shv_keys_idx[0] ] };
}

=head2 C<< shallow_clone() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Creates a new hashref with the same keys and values as the original.

=cut

sub shallow_clone {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or
      Hydrogen::croak( "Wrong number of parameters for shallow_clone; usage: "
          . "Hydrogen::Topic::HashRef::shallow_clone()" );
    +{ %{$_} };
}

=head2 C<< sorted_keys() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns an alphabetically sorted list of keys in the hash.

=cut

sub sorted_keys {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for sorted_keys; usage: "
          . "Hydrogen::Topic::HashRef::sorted_keys()" );
    sort( keys %{$_} );
}

=head2 C<< values() >>

Operates on C<< $_ >>, which must be a reference to a hash.

Returns the list of values in the hash.

=cut

sub values {

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for values; usage: "
          . "Hydrogen::Topic::HashRef::values()" );
    values %{$_};
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Topic::HashRef -all;

To import a particular function, use:

    use Hydrogen::Topic::HashRef 'clear';

To rename functions:

    use Hydrogen::Topic::HashRef 'clear' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::HashRef>,
L<Hydrogen::Hash>,
L<Hydrogen::Curry::HashRef>,
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

