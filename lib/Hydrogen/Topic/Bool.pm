# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Topic::Bool;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.015';

=head1 NAME

Hydrogen::Topic::Bool - functions from Hydrogen::Bool applied to C<$_>

=head1 VERSION

This documentation is for Hydrogen::Topic::Bool 0.015,
which is based on Sub::HandlesVia::HandlerLibrary::Bool 0.037.

=cut

=head1 FUNCTIONS

Each function implicitly operates on C<< $_ >>, expecting it to be a scalar which will be treated as a boolean.

=cut

use Exporter::Shiny qw(
    not
    reset
    set
    toggle
    unset
);

=head2 C<< not() >>

Operates on C<< $_ >>, which must be a scalar which will be treated as a boolean.

Returns the opposite value of the boolean.

=cut

sub not {

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for not; usage: "
          . "Hydrogen::Topic::Bool::not()" );
    !$_;
}

=head2 C<< reset() >>

Operates on C<< $_ >>, which must be a scalar which will be treated as a boolean.

Sets the boolean to its default value, or false if it has no default.

=cut

sub reset {

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for reset; usage: "
          . "Hydrogen::Topic::Bool::reset()" );
    ( $_ = !!0 );
}

=head2 C<< set() >>

Operates on C<< $_ >>, which must be a scalar which will be treated as a boolean.

Sets the value of the boolean to true.

=cut

sub set {

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for set; usage: "
          . "Hydrogen::Topic::Bool::set()" );
    ( $_ = !!1 );
}

=head2 C<< toggle() >>

Operates on C<< $_ >>, which must be a scalar which will be treated as a boolean.

Toggles the truth value of the boolean.

=cut

sub toggle {

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for toggle; usage: "
          . "Hydrogen::Topic::Bool::toggle()" );
    ( $_ = !$_ );
}

=head2 C<< unset() >>

Operates on C<< $_ >>, which must be a scalar which will be treated as a boolean.

Sets the value of the boolean to false.

=cut

sub unset {

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for unset; usage: "
          . "Hydrogen::Topic::Bool::unset()" );
    ( $_ = !!0 );
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Topic::Bool -all;

To import a particular function, use:

    use Hydrogen::Topic::Bool 'set';

To rename functions:

    use Hydrogen::Topic::Bool 'set' => { -as => 'myfunc' };

On Perl 5.37.2+, you can import lexically:

    use Hydrogen::Topic::Bool -lexical, 'set';

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Bool>,
L<Hydrogen::Curry::Bool>,
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

