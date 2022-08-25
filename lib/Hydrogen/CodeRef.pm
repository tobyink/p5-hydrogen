# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::CodeRef;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.006';

=head1 NAME

Hydrogen::CodeRef - a standard library for coderefs

=head1 VERSION

This documentation is for Hydrogen::CodeRef 0.006.

=cut

=head1 FUNCTIONS

Each function expects a reference to a sub as its first argument.

=cut

use Exporter::Shiny qw(
    execute
);

=head2 C<< execute( $coderef, @args ) >>

Calls the coderef, passing it any arguments.

=cut

sub execute {
    my $__REF__ = \$_[0];

    package Hydrogen::CodeRef::__SANDBOX__;
    $$__REF__->( @_[ 1 .. $#_ ] );
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use Hydrogen::CodeRef -all;

To import a particular function, use:

    use Hydrogen::CodeRef 'execute';

To rename functions:

    use Hydrogen::CodeRef 'execute' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Curry::CodeRef>,
L<Sub::HandlesVia::HandlerLibrary::Code>.

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


