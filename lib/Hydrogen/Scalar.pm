# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Scalar;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.012';

=head1 NAME

Hydrogen::Scalar - a standard library for scalars

=head1 VERSION

This documentation is for Hydrogen::Scalar 0.012,
which is based on Sub::HandlesVia::HandlerLibrary::Scalar 0.036.

=cut

=head1 FUNCTIONS

Each function expects a scalar as its first argument.

=cut

use Exporter::Shiny qw(
    make_getter
    make_setter
);

=head2 C<< make_getter( $scalar ) >>

Returns a getter coderef.

=cut

sub make_getter {
    my $__REF__ = \$_[0];

    package Hydrogen::Scalar::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for make_getter; usage: "
          . "Hydrogen::Scalar::make_getter( \$scalar )" );
    my $s = $__REF__;
    sub { unshift @_, $s; $$__REF__ }
}

=head2 C<< make_setter( $scalar ) >>

Returns a setter coderef.

=cut

sub make_setter {
    my $__REF__ = \$_[0];

    package Hydrogen::Scalar::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for make_setter; usage: "
          . "Hydrogen::Scalar::make_setter( \$scalar )" );
    my $s = $__REF__;
    sub { my $val = shift; unshift @_, $s; ( ${$__REF__} = $val ) }
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Scalar -all;

To import a particular function, use:

    use Hydrogen::Scalar 'make_getter';

To rename functions:

    use Hydrogen::Scalar 'make_getter' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Curry::Scalar>,
L<Hydrogen::Topic::Scalar>,
L<Sub::HandlesVia::HandlerLibrary::Scalar>.

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

