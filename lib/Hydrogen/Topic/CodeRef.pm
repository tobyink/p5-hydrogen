# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Topic::CodeRef;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.006';

=head1 NAME

Hydrogen::Topic::CodeRef - functions from Hydrogen::CodeRef applied to C<< $_ >>

=head1 VERSION

This documentation is for Hydrogen::Topic::CodeRef 0.006.

=cut

=head1 FUNCTIONS

Each function implicitly operates on C<< $_ >>, expecting it to be a reference to a sub.

=cut

use Exporter::Shiny qw(
    execute
);

=head2 C<< execute( @args ) >>

Operates on C<< $_ >>, which must be a reference to a sub.

Calls the coderef, passing it any arguments.

=cut

sub execute {

    package Hydrogen::CodeRef::__SANDBOX__;
    $_->(@_);
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use Hydrogen::Topic::CodeRef -all;

To import a particular function, use:

    use Hydrogen::Topic::CodeRef 'execute';

To rename functions:

    use Hydrogen::Topic::CodeRef 'execute' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::CodeRef>,
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

