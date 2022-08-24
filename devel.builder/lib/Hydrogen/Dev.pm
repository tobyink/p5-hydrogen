use 5.012;
use strict;
use warnings;

use Hydrogen::Dev::Type ();

package Hydrogen::Dev;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.003';

use Hydrogen::Dev::Mite -all;

param author_cpanid    => ( isa => 'Str', default => 'tobyink' );
param author_name      => ( isa => 'Str', default => 'Toby Inkster' );
param copyright_years  => ( isa => 'Str', default => '2022' );
param target_version   => ( isa => 'Str', builder => sub { $VERSION } );
param bug_tracker      => ( isa => 'Str', default => 'http://github.com/tobyink/p5-hydrogen/issues' );
param target_namespace => ( isa => 'Str', default => 'Hydrogen' );
param target_directory => ( isa => 'Str', default => 'lib' );
param test_directory   => ( isa => 'Str', default => 't/unit' );

field types            => ( isa => 'ArrayRef', builder => true );
field reference_types  => ( isa => 'ArrayRef', builder => true );

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

sub write_all {
	my $self = shift;

	$self->write_modules;
	$self->write_curry_modules;
	$self->write_tests;
	$self->write_curry_tests;
}

sub write_modules {
	my $self = shift;

	for my $type ( @{ $self->types }, @{ $self->reference_types } ) {
		$type->write_module;
	}

	return $self;
}

sub write_curry_modules {
	my $self = shift;

	for my $type ( @{ $self->types }, @{ $self->reference_types } ) {
		$type->write_curry_module unless $type->is_prototyped;
	}

	return $self;
}

sub write_tests {
	my $self = shift;

	for my $type ( @{ $self->types }, @{ $self->reference_types } ) {
		$type->write_test;
	}

	return $self;
}

sub write_curry_tests {
	my $self = shift;

	for my $type ( @{ $self->types }, @{ $self->reference_types } ) {
		$type->write_curry_test unless $type->is_prototyped;
	}

	return $self;
}

sub compile_bug_section {
	my $self = shift;

	return <<"EOTEXT";
=head1 BUGS

Please report any bugs to
L<@{[ $self->bug_tracker ]}>.
EOTEXT
}

sub compile_author_section {
	my $self = shift;

	return <<"EOTEXT";
=head1 AUTHOR

@{[ $self->author_name ]} E<lt>@{[ lc $self->author_cpanid ]}\@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) @{[ $self->copyright_years ]} by @{[ $self->author_name ]}.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DISCLAIMER OF WARRANTIES

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

EOTEXT
}

1;
