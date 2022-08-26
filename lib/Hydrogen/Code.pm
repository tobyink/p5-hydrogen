# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Code;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.012';

=head1 NAME

Hydrogen::Code - a standard library for code blocks

=head1 VERSION

This documentation is for Hydrogen::Code 0.012,
which is based on Sub::HandlesVia::HandlerLibrary::Code 0.036.

=cut

=head1 FUNCTIONS

Each function expects a code block as its first argument.

The functions use prototypes, so you don't have to pass a reference.

=cut

use Exporter::Shiny qw(
    execute
    execute_list
    execute_scalar
    execute_void
);

=head2 C<< execute { CODE } @args >>

Calls the coderef, passing it any arguments.

=cut

sub execute (&;@) {
    my $__REF__ = \$_[0];

    package Hydrogen::Code::__SANDBOX__;
    $$__REF__->( @_[ 1 .. $#_ ] );
}

=head2 C<< execute_list { CODE } @args >>

Calls the coderef, passing it any arguments, and forcing list context. If called in scalar context, returns an arrayref.

=cut

sub execute_list (&;@) {
    my $__REF__ = \$_[0];

    package Hydrogen::Code::__SANDBOX__;
    my @shv_list = $$__REF__->( @_[ 1 .. $#_ ] );
    wantarray ? @shv_list : \@shv_list;
}

=head2 C<< execute_scalar { CODE } @args >>

Calls the coderef, passing it any arguments, and forcing scalar context.

=cut

sub execute_scalar (&;@) {
    my $__REF__ = \$_[0];

    package Hydrogen::Code::__SANDBOX__;
    scalar( $$__REF__->( @_[ 1 .. $#_ ] ) );
}

=head2 C<< execute_void { CODE } @args >>

Calls the coderef, passing it any arguments, and forcing void context. Returns undef.

=cut

sub execute_void (&;@) {
    my $__REF__ = \$_[0];

    package Hydrogen::Code::__SANDBOX__;
    $$__REF__->( @_[ 1 .. $#_ ] );
    undef;
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Code -all;

To import a particular function, use:

    use Hydrogen::Code 'execute_scalar';

To rename functions:

    use Hydrogen::Code 'execute_scalar' => { -as => 'myfunc' };

On Perl 5.37.2+, you can import lexically:

    use Hydrogen::Code -lexical, 'execute_scalar';

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
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

