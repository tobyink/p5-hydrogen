# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::CodeRef;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.012';

=head1 NAME

Hydrogen::CodeRef - a standard library for coderefs

=head1 VERSION

This documentation is for Hydrogen::CodeRef 0.012.

=cut

=head1 FUNCTIONS

Each function expects a reference to a sub as its first argument.

=cut

use Exporter::Shiny qw(
    execute
    execute_list
    execute_scalar
    execute_void
);

=head2 C<< execute( $coderef, @args ) >>

Calls the coderef, passing it any arguments.

=cut

sub execute {
    my $__REF__ = \$_[0];

    package Hydrogen::CodeRef::__SANDBOX__;
    $$__REF__->( @_[ 1 .. $#_ ] );
}

=head2 C<< execute_list( $coderef, @args ) >>

Calls the coderef, passing it any arguments, and forcing list context. If called in scalar context, returns an arrayref.

=cut

sub execute_list {
    my $__REF__ = \$_[0];

    package Hydrogen::CodeRef::__SANDBOX__;
    my @shv_list = $$__REF__->( @_[ 1 .. $#_ ] );
    wantarray ? @shv_list : \@shv_list;
}

=head2 C<< execute_scalar( $coderef, @args ) >>

Calls the coderef, passing it any arguments, and forcing scalar context.

=cut

sub execute_scalar {
    my $__REF__ = \$_[0];

    package Hydrogen::CodeRef::__SANDBOX__;
    scalar( $$__REF__->( @_[ 1 .. $#_ ] ) );
}

=head2 C<< execute_void( $coderef, @args ) >>

Calls the coderef, passing it any arguments, and forcing void context. Returns undef.

=cut

sub execute_void {
    my $__REF__ = \$_[0];

    package Hydrogen::CodeRef::__SANDBOX__;
    $$__REF__->( @_[ 1 .. $#_ ] );
    undef;
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::CodeRef -all;

To import a particular function, use:

    use Hydrogen::CodeRef 'execute_scalar';

To rename functions:

    use Hydrogen::CodeRef 'execute_scalar' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Code>,
L<Hydrogen::Curry::CodeRef>,
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

