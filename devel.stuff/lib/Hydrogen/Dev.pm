use 5.012;
use strict;
use warnings;

use Hydrogen::Dev::Type ();

package Hydrogen::Dev;

use Moo;

has target_namespace => ( is => 'ro', default => 'Hydrogen' );
has target_directory => ( is => 'ro', default => 'lib' );

has types            => ( is => 'lazy', init_arg => undef );
has reference_types  => ( is => 'lazy', init_arg => undef );

sub _make_type {
	shift;
	return 'Hydrogen::Dev::Type'->new( @_ );
}

sub _build_types {
	my $self = shift;

	my @types = map {
		$self->_make_type(
			type_name     => $_,
			dev           => $self,
			is_prototyped => !!0,
		);
	} $self->_type_names;

	return \@types;
}

sub _type_names {
	return qw(
		Array
		Bool
		Code
		Counter
		Hash
		Number
		Scalar
		String
	);
}

sub _build_reference_types {
	my $self = shift;

	my @types = map {
		$self->_make_type(
			type_name     => $_,
			dev           => $self,
			is_prototyped => !!1,
		);
	} $self->_reference_type_names;

	return \@types;
}

sub _reference_type_names {
	return qw(
		Array
		Code
		Hash
	);
}

sub write_modules {
	my $self = shift;

	for my $type ( @{ $self->types }, @{ $self->reference_types } ) {
		$type->write_module;
	}

	return $self;
}

sub compile_bug_section {
	return <<'EOTEXT';
=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.
EOTEXT
}

sub compile_author_section {
	return <<'EOTEXT';
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

EOTEXT
}

1;
