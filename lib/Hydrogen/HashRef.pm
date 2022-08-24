# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::HashRef;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.002';

=head1 NAME

Hydrogen::HashRef - a standard library for hashrefs

=cut

=head1 FUNCTIONS

Each function expects a reference to a hash as its first argument.

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

=head2 C<< accessor( $hash, $key, $value? ) >>

Additional arguments: B<< Str >>, B<< Optional[Any] >>.

Acts like C<get> if given one argument, or C<set> if given two arguments.

=cut

{
    my $__signature;

    sub accessor {
        my $__REF__ = \$_[0];

        package Hydrogen::HashRef::__SANDBOX__;
        $__signature ||= sub {
            my ( %tmp, $tmp );

            @_ >= 2 && @_ <= 3
              or Hydrogen::croak(
                "Wrong number of parameters in signature for %s: got %d, %s",
                "accessor", scalar(@_), "expected exactly 2 parameters" );

            # Parameter $_[0] (type: HashRef)
            ( ref( $_[0] ) eq 'HASH' )
              or Hydrogen::croak(
                "Type check failed in signature for accessor: %s should be %s",
                "\$_[0]", "HashRef"
              );

            # Parameter $_[1] (type: Str)
            do {

                package Hydrogen::HashRef::__SANDBOX__;
                defined( $_[1] ) and do {
                    ref( \$_[1] ) eq 'SCALAR'
                      or ref( \( my $val = $_[1] ) ) eq 'SCALAR';
                }
              }
              or Hydrogen::croak(
                "Type check failed in signature for accessor: %s should be %s",
                "\$_[1]", "Str"
              );

            # Parameter $_[2] (type: Optional[Any])
            $#_ >= 2
              or return (@_);
            ( !!1 )
              or Hydrogen::croak(
                "Type check failed in signature for accessor: %s should be %s",
                "\$_[2]", "Optional[Any]"
              );

            (@_);
        };
        @_ = &$__signature;
        1;
        my $shv_ref_invocant = do { $$__REF__ };
        if ( ( @_ - 1 ) == 1 ) { ($shv_ref_invocant)->{ $_[1] } }
        else {
            my %shv_tmp = %{$shv_ref_invocant};
            $shv_tmp{ $_[1] } = $_[2];
            ( %{ $_[0] } = %{ +\%shv_tmp } );
        }
    }
}

=head2 C<< all( $hash ) >>

Returns the hash in list context.

=cut

sub all {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for all; usage: "
          . "Hydrogen::HashRef::all( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    %{$shv_ref_invocant};
}

=head2 C<< clear( $hash ) >>

Empties the hash.

=cut

sub clear {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for clear; usage: "
          . "Hydrogen::HashRef::clear( \$hash )" );
    1;
    my $shv_ref_invocant = do { $$__REF__ };
    ( %{ $_[0] } = () );
}

=head2 C<< count( $hash ) >>

Returns the number of keys in the hash.

=cut

sub count {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for count; usage: "
          . "Hydrogen::HashRef::count( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    scalar keys %{$shv_ref_invocant};
}

=head2 C<< defined( $hash, $key ) >>

Additional arguments: B<< Str >>.

Indicates whether a value exists and is defined in the hashref by its key.

=cut

sub defined {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "defined", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: HashRef)
        ( ref( $_[0] ) eq 'HASH' )
          or Hydrogen::croak(
            "Type check failed in signature for defined: %s should be %s",
            "\$_[0]", "HashRef" );

        # Parameter $_[1] (type: Str)
        do {

            package Hydrogen::HashRef::__SANDBOX__;
            defined( $_[1] ) and do {
                ref( \$_[1] ) eq 'SCALAR'
                  or ref( \( my $val = $_[1] ) ) eq 'SCALAR';
            }
          }
          or Hydrogen::croak(
            "Type check failed in signature for defined: %s should be %s",
            "\$_[1]", "Str" );

        (@_);
    };
    my $shv_ref_invocant = do { $$__REF__ };
    defined( ($shv_ref_invocant)->{ $_[1] } );
}

=head2 C<< delete( $hash, $key ) >>

Removes a value from the hashref by its key.

=cut

sub delete {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ >= 2
      or Hydrogen::croak( "Wrong number of parameters for delete; usage: "
          . "Hydrogen::HashRef::delete( \$hash, \$key )" );
    1;
    my $shv_ref_invocant = do { $$__REF__ };
    my %shv_tmp          = %{$shv_ref_invocant};
    my @shv_return       = delete @shv_tmp{ @_[ 1 .. $#_ ] };
    ( %{ $_[0] } = %{ +\%shv_tmp } );
    wantarray ? @shv_return : $shv_return[-1];
}

=head2 C<< elements( $hash ) >>

Returns the hash in list context.

=cut

sub elements {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for elements; usage: "
          . "Hydrogen::HashRef::elements( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    %{$shv_ref_invocant};
}

=head2 C<< exists( $hash, $key ) >>

Additional arguments: B<< Str >>.

Indicates whether a value exists in the hashref by its key.

=cut

sub exists {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "exists", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: HashRef)
        ( ref( $_[0] ) eq 'HASH' )
          or Hydrogen::croak(
            "Type check failed in signature for exists: %s should be %s",
            "\$_[0]", "HashRef" );

        # Parameter $_[1] (type: Str)
        do {

            package Hydrogen::HashRef::__SANDBOX__;
            defined( $_[1] ) and do {
                ref( \$_[1] ) eq 'SCALAR'
                  or ref( \( my $val = $_[1] ) ) eq 'SCALAR';
            }
          }
          or Hydrogen::croak(
            "Type check failed in signature for exists: %s should be %s",
            "\$_[1]", "Str" );

        (@_);
    };
    my $shv_ref_invocant = do { $$__REF__ };
    defined( ($shv_ref_invocant)->{ $_[1] } );
}

=head2 C<< for_each_key( $hash, $coderef ) >>

Additional arguments: B<< CodeRef >>.

Function which calls the coderef for each key in the hash, passing just the key to the coderef.

=cut

sub for_each_key {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "for_each_key", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: HashRef)
        ( ref( $_[0] ) eq 'HASH' )
          or Hydrogen::croak(
            "Type check failed in signature for for_each_key: %s should be %s",
            "\$_[0]", "HashRef"
          );

        # Parameter $_[1] (type: CodeRef)
        ( ref( $_[1] ) eq 'CODE' )
          or Hydrogen::croak(
            "Type check failed in signature for for_each_key: %s should be %s",
            "\$_[1]", "CodeRef"
          );

        (@_);
    };
    my $shv_ref_invocant = do { $$__REF__ };
    for my $shv_key ( keys %{$shv_ref_invocant} ) { &{ $_[1] }($shv_key) };
    $__REF__;
}

=head2 C<< for_each_pair( $hash, $coderef ) >>

Additional arguments: B<< CodeRef >>.

Function which calls the coderef for each key in the hash, passing the key and value to the coderef.

=cut

sub for_each_pair {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "for_each_pair", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: HashRef)
        ( ref( $_[0] ) eq 'HASH' )
          or Hydrogen::croak(
            "Type check failed in signature for for_each_pair: %s should be %s",
            "\$_[0]", "HashRef"
          );

        # Parameter $_[1] (type: CodeRef)
        ( ref( $_[1] ) eq 'CODE' )
          or Hydrogen::croak(
            "Type check failed in signature for for_each_pair: %s should be %s",
            "\$_[1]", "CodeRef"
          );

        (@_);
    };
    my $shv_ref_invocant = do { $$__REF__ };
    while ( my ( $shv_key, $shv_value ) = each %{$shv_ref_invocant} ) {
        &{ $_[1] }( $shv_key, $shv_value );
    };
    $__REF__;
}

=head2 C<< for_each_value( $hash, $coderef ) >>

Additional arguments: B<< CodeRef >>.

Function which calls the coderef for each value in the hash, passing just the value to the coderef.

=cut

sub for_each_value {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "for_each_value", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: HashRef)
        ( ref( $_[0] ) eq 'HASH' )
          or Hydrogen::croak(
"Type check failed in signature for for_each_value: %s should be %s",
            "\$_[0]", "HashRef"
          );

        # Parameter $_[1] (type: CodeRef)
        ( ref( $_[1] ) eq 'CODE' )
          or Hydrogen::croak(
"Type check failed in signature for for_each_value: %s should be %s",
            "\$_[1]", "CodeRef"
          );

        (@_);
    };
    my $shv_ref_invocant = do { $$__REF__ };
    for my $shv_value ( values %{$shv_ref_invocant} ) { &{ $_[1] }($shv_value) };
    $__REF__;
}

=head2 C<< get( $hash, $key ) >>

Returns a value from the hashref by its key.

=cut

sub get {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ >= 2
      or Hydrogen::croak( "Wrong number of parameters for get; usage: "
          . "Hydrogen::HashRef::get( \$hash, \$key )" );
    my $shv_ref_invocant = do { $$__REF__ };
    ( @_ - 1 ) > 1
      ? @{$shv_ref_invocant}{ @_[ 1 .. $#_ ] }
      : ($shv_ref_invocant)->{ $_[1] };
}

=head2 C<< is_empty( $hash ) >>

Returns true iff there are no keys in the hash.

=cut

sub is_empty {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for is_empty; usage: "
          . "Hydrogen::HashRef::is_empty( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    !scalar keys %{$shv_ref_invocant};
}

=head2 C<< keys( $hash ) >>

Returns the list of keys in the hash.

=cut

sub keys {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for keys; usage: "
          . "Hydrogen::HashRef::keys( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    keys %{$shv_ref_invocant};
}

=head2 C<< kv( $hash ) >>

Returns a list of arrayrefs, where each arrayref is a key-value pair.

=cut

sub kv {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for kv; usage: "
          . "Hydrogen::HashRef::kv( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    map [ $_ => ($shv_ref_invocant)->{$_} ], keys %{$shv_ref_invocant};
}

=head2 C<< reset( $hash ) >>

Resets the original value to its default value, or an empty hashref if it has no default.

=cut

sub reset {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for reset; usage: "
          . "Hydrogen::HashRef::reset( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    (
        %{ $_[0] } = %{
            +do {
                my $shv_final_unchecked = {};
                do {
                    ( ref($shv_final_unchecked) eq 'HASH' )
                      or Hydrogen::croak(
"Type check failed in delegated method: expected %s, got value %s",
                        "HashRef", $shv_final_unchecked
                      );
                    $shv_final_unchecked;
                };
            }
        }
    );
}

=head2 C<< set( $hash, $key, $value, ... ) >>

Given a key and value, adds the key to the hashref with the given value.

=cut

sub set {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ >= 3
      or Hydrogen::croak( "Wrong number of parameters for set; usage: "
          . "Hydrogen::HashRef::set( \$hash, \$key, \$value, ... )" );
    my $shv_ref_invocant = do { $$__REF__ };
    my (@shv_params) = @_[ 1 .. $#_ ];
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
"Type check failed in delegated method: expected %s, got value %s",
                "Str", $shv_params[$shv_tmp]
              );
            $shv_params[$shv_tmp];
        };
    };
    my %shv_tmp = %{$shv_ref_invocant};
    @shv_tmp{ @shv_params[@shv_keys_idx] } = @shv_params[@shv_values_idx];
    ( %{ $_[0] } = %{ +\%shv_tmp } );
    wantarray
      ? @shv_tmp{ @shv_params[@shv_keys_idx] }
      : $shv_tmp{ $shv_params[ $shv_keys_idx[0] ] };
}

=head2 C<< shallow_clone( $hash ) >>

Creates a new hashref with the same keys and values as the original.

=cut

sub shallow_clone {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or
      Hydrogen::croak( "Wrong number of parameters for shallow_clone; usage: "
          . "Hydrogen::HashRef::shallow_clone( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    +{ %{$shv_ref_invocant} };
}

=head2 C<< sorted_keys( $hash ) >>

Returns an alphabetically sorted list of keys in the hash.

=cut

sub sorted_keys {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for sorted_keys; usage: "
          . "Hydrogen::HashRef::sorted_keys( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    sort( keys %{$shv_ref_invocant} );
}

=head2 C<< values( $hash ) >>

Returns the list of values in the hash.

=cut

sub values {
    my $__REF__ = \$_[0];

    package Hydrogen::HashRef::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for values; usage: "
          . "Hydrogen::HashRef::values( \$hash )" );
    my $shv_ref_invocant = do { $$__REF__ };
    values %{$shv_ref_invocant};
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use Hydrogen::HashRef -all;

To import a particular function, use:

    use Hydrogen::HashRef 'clear';

To rename functions:

    use Hydrogen::HashRef 'clear' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Curry::HashRef>,
L<Sub::HandlesVia::HandlerLibrary::Hash>.

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


