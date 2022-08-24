# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Bool;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.001';

=head1 NAME

Hydrogen::Bool - a standard library for booleans

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

=head2 C<< Hydrogen::Bool::not( $bool ) >>

Returns the opposite value of the boolean.

=cut

sub not {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for not; usage: "
          . "Hydrogen::Bool::not( \$bool )" );
    do { my $shv_real_invocant = $$__REF__; !$shv_real_invocant }
}

=head2 C<< Hydrogen::Bool::reset( $bool ) >>

Sets the boolean to its default value, or false if it has no default.

=cut

sub reset {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for reset; usage: "
          . "Hydrogen::Bool::reset( \$bool )" );
    do {
        my $shv_real_invocant = $$__REF__;
        (
            ${$__REF__} = do {
                my $shv_final_unchecked = !!0;
                do {
                    ( !!1 )
                      or Hydrogen::croak(
"Type check failed in delegated method: expected %s, got value %s",
                        "Any", $shv_final_unchecked
                      );
                    $shv_final_unchecked;
                };
            }
        );
    }
}

=head2 C<< Hydrogen::Bool::set( $bool ) >>

Sets the value of the boolean to true.

=cut

sub set {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for set; usage: "
          . "Hydrogen::Bool::set( \$bool )" );
    do {
        my $shv_real_invocant = $$__REF__;
        (
            ${$__REF__} = do {
                my $shv_final_unchecked = !!1;
                do {
                    ( !!1 )
                      or Hydrogen::croak(
"Type check failed in delegated method: expected %s, got value %s",
                        "Any", $shv_final_unchecked
                      );
                    $shv_final_unchecked;
                };
            }
        );
    }
}

=head2 C<< Hydrogen::Bool::toggle( $bool ) >>

Toggles the truth value of the boolean.

=cut

sub toggle {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for toggle; usage: "
          . "Hydrogen::Bool::toggle( \$bool )" );
    do {
        my $shv_real_invocant = $$__REF__;
        (
            ${$__REF__} = do {
                my $shv_final_unchecked = !$shv_real_invocant;
                do {
                    ( !!1 )
                      or Hydrogen::croak(
"Type check failed in delegated method: expected %s, got value %s",
                        "Any", $shv_final_unchecked
                      );
                    $shv_final_unchecked;
                };
            }
        );
    }
}

=head2 C<< Hydrogen::Bool::unset( $bool ) >>

Sets the value of the boolean to false.

=cut

sub unset {
    my $__REF__ = \$_[0];

    package Hydrogen::Bool::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for unset; usage: "
          . "Hydrogen::Bool::unset( \$bool )" );
    do {
        my $shv_real_invocant = $$__REF__;
        (
            ${$__REF__} = do {
                my $shv_final_unchecked = !!0;
                do {
                    ( !!1 )
                      or Hydrogen::croak(
"Type check failed in delegated method: expected %s, got value %s",
                        "Any", $shv_final_unchecked
                      );
                    $shv_final_unchecked;
                };
            }
        );
    }
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use Hydrogen::Bool -all;

To import a particular function, use:

    use Hydrogen::Bool 'set';

To rename functions:

    use Hydrogen::Bool 'set' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>, L<Sub::HandlesVia::HandlerLibrary::Bool>.

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


