# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Bool;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.020000';

=head1 NAME

Hydrogen::Bool - a standard library for booleans

=head1 VERSION

This documentation is for Hydrogen::Bool 0.020000,
which is based on Sub::HandlesVia::HandlerLibrary::Bool 0.046.

=cut

=head1 FUNCTIONS

Each function expects a scalar which will be treated as a boolean as its first argument.

=cut

use Exporter::Shiny qw(
    not
    reset
    set
    toggle
    unset
);

=head2 C<< not( $bool ) >>

Returns the opposite value of the boolean.

=cut

sub not {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for not; usage: "
          . "Hydrogen::Bool::not( \$bool )" );
    !$$__REF__;
}

=head2 C<< reset( $bool ) >>

Sets the boolean to its default value, or false if it has no default.

=cut

sub reset {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for reset; usage: "
          . "Hydrogen::Bool::reset( \$bool )" );
    ( ${$__REF__} = !!0 );
}

=head2 C<< set( $bool ) >>

Sets the value of the boolean to true.

=cut

sub set {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for set; usage: "
          . "Hydrogen::Bool::set( \$bool )" );
    ( ${$__REF__} = !!1 );
}

=head2 C<< toggle( $bool ) >>

Toggles the truth value of the boolean.

=cut

sub toggle {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for toggle; usage: "
          . "Hydrogen::Bool::toggle( \$bool )" );
    ( ${$__REF__} = !$$__REF__ );
}

=head2 C<< unset( $bool ) >>

Sets the value of the boolean to false.

=cut

sub unset {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for unset; usage: "
          . "Hydrogen::Bool::unset( \$bool )" );
    ( ${$__REF__} = !!0 );
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Bool -all;

To import a particular function, use:

    use Hydrogen::Bool 'set';

To rename functions:

    use Hydrogen::Bool 'set' => { -as => 'myfunc' };

On Perl 5.37.2+, you can import lexically:

    use Hydrogen::Bool -lexical, 'set';

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Curry::Bool>,
L<Hydrogen::Topic::Bool>,
L<Sub::HandlesVia::HandlerLibrary::Bool>.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2022-2023 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DISCLAIMER OF WARRANTIES

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

