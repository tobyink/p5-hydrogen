# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();
use Hydrogen::CodeRef ();

package Hydrogen::Curry::CodeRef;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.011';

=head1 NAME

Hydrogen::Curry::CodeRef - easily curry functions from Hydrogen::CodeRef

=head1 VERSION

This documentation is for Hydrogen::Curry::CodeRef 0.011.

=cut

=head1 FUNCTIONS

Each function expects a reference to a sub as its only argument and returns a coderef.

=cut

use Exporter::Shiny qw(
    curry_execute
    curry_execute_list
    curry_execute_scalar
    curry_execute_void
);

=head2 C<< curry_execute( $coderef ) >>

Curry the first argument of C<< Hydrogen::CodeRef::execute >>.

=cut

sub curry_execute {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_execute: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'CODE')
        or Hydrogen::croak(
            "Type check failed in signature for curry_execute: %s should be %s",
            "\\$_[0]", "CodeRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::CodeRef::execute( $$ref, @_ ) };
}

=head2 C<< curry_execute_list( $coderef ) >>

Curry the first argument of C<< Hydrogen::CodeRef::execute_list >>.

=cut

sub curry_execute_list {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_execute_list: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'CODE')
        or Hydrogen::croak(
            "Type check failed in signature for curry_execute_list: %s should be %s",
            "\\$_[0]", "CodeRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::CodeRef::execute_list( $$ref, @_ ) };
}

=head2 C<< curry_execute_scalar( $coderef ) >>

Curry the first argument of C<< Hydrogen::CodeRef::execute_scalar >>.

=cut

sub curry_execute_scalar {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_execute_scalar: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'CODE')
        or Hydrogen::croak(
            "Type check failed in signature for curry_execute_scalar: %s should be %s",
            "\\$_[0]", "CodeRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::CodeRef::execute_scalar( $$ref, @_ ) };
}

=head2 C<< curry_execute_void( $coderef ) >>

Curry the first argument of C<< Hydrogen::CodeRef::execute_void >>.

=cut

sub curry_execute_void {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_execute_void: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'CODE')
        or Hydrogen::croak(
            "Type check failed in signature for curry_execute_void: %s should be %s",
            "\\$_[0]", "CodeRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::CodeRef::execute_void( $$ref, @_ ) };
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Curry::CodeRef -all;

To import a particular function, use:

    use Hydrogen::Curry::CodeRef 'curry_execute_scalar';

To rename functions:

    use Hydrogen::Curry::CodeRef 'curry_execute_scalar' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::CodeRef>,
L<Hydrogen::Code>,
L<Hydrogen::Topic::CodeRef>,
L<Sub::HandlesVia::HandlerLibrary::Code>,
L<Sub::Util>.

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

