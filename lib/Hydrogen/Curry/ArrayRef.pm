# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();
use Hydrogen::ArrayRef ();

package Hydrogen::Curry::ArrayRef;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.018';

=head1 NAME

Hydrogen::Curry::ArrayRef - easily curry functions from Hydrogen::ArrayRef

=head1 VERSION

This documentation is for Hydrogen::Curry::ArrayRef 0.017,
which is based on Sub::HandlesVia::HandlerLibrary::Array 0.046.

=cut

=head1 FUNCTIONS

Each function expects a reference to an array as its only argument and returns a coderef.

=cut

use Exporter::Shiny qw(
    curry_accessor
    curry_all
    curry_all_true
    curry_any
    curry_apply
    curry_clear
    curry_count
    curry_delete
    curry_elements
    curry_first
    curry_first_index
    curry_flatten
    curry_flatten_deep
    curry_for_each
    curry_for_each_pair
    curry_get
    curry_grep
    curry_head
    curry_insert
    curry_is_empty
    curry_join
    curry_map
    curry_max
    curry_maxstr
    curry_min
    curry_minstr
    curry_natatime
    curry_not_all_true
    curry_pairfirst
    curry_pairgrep
    curry_pairkeys
    curry_pairmap
    curry_pairs
    curry_pairvalues
    curry_pick_random
    curry_pop
    curry_print
    curry_product
    curry_push
    curry_reduce
    curry_reductions
    curry_reset
    curry_reverse
    curry_sample
    curry_set
    curry_shallow_clone
    curry_shift
    curry_shuffle
    curry_shuffle_in_place
    curry_sort
    curry_sort_in_place
    curry_splice
    curry_sum
    curry_tail
    curry_uniq
    curry_uniq_in_place
    curry_uniqnum
    curry_uniqnum_in_place
    curry_uniqstr
    curry_uniqstr_in_place
    curry_unshift
);

=head2 C<< curry_accessor( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::accessor >>.

=cut

sub curry_accessor {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_accessor: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_accessor: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::accessor( $$ref, @_ ) };
}

=head2 C<< curry_all( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::all >>.

=cut

sub curry_all {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_all: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_all: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::all( $$ref, @_ ) };
}

=head2 C<< curry_all_true( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::all_true >>.

=cut

sub curry_all_true {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_all_true: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_all_true: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::all_true( $$ref, @_ ) };
}

=head2 C<< curry_any( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::any >>.

=cut

sub curry_any {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_any: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_any: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::any( $$ref, @_ ) };
}

=head2 C<< curry_apply( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::apply >>.

=cut

sub curry_apply {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_apply: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_apply: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::apply( $$ref, @_ ) };
}

=head2 C<< curry_clear( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::clear >>.

=cut

sub curry_clear {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_clear: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_clear: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::clear( $$ref, @_ ) };
}

=head2 C<< curry_count( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::count >>.

=cut

sub curry_count {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_count: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_count: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::count( $$ref, @_ ) };
}

=head2 C<< curry_delete( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::delete >>.

=cut

sub curry_delete {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_delete: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_delete: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::delete( $$ref, @_ ) };
}

=head2 C<< curry_elements( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::elements >>.

=cut

sub curry_elements {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_elements: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_elements: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::elements( $$ref, @_ ) };
}

=head2 C<< curry_first( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::first >>.

=cut

sub curry_first {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_first: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_first: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::first( $$ref, @_ ) };
}

=head2 C<< curry_first_index( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::first_index >>.

=cut

sub curry_first_index {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_first_index: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_first_index: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::first_index( $$ref, @_ ) };
}

=head2 C<< curry_flatten( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::flatten >>.

=cut

sub curry_flatten {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_flatten: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_flatten: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::flatten( $$ref, @_ ) };
}

=head2 C<< curry_flatten_deep( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::flatten_deep >>.

=cut

sub curry_flatten_deep {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_flatten_deep: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_flatten_deep: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::flatten_deep( $$ref, @_ ) };
}

=head2 C<< curry_for_each( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::for_each >>.

=cut

sub curry_for_each {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_for_each: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_for_each: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::for_each( $$ref, @_ ) };
}

=head2 C<< curry_for_each_pair( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::for_each_pair >>.

=cut

sub curry_for_each_pair {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_for_each_pair: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_for_each_pair: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::for_each_pair( $$ref, @_ ) };
}

=head2 C<< curry_get( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::get >>.

=cut

sub curry_get {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_get: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_get: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::get( $$ref, @_ ) };
}

=head2 C<< curry_grep( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::grep >>.

=cut

sub curry_grep {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_grep: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_grep: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::grep( $$ref, @_ ) };
}

=head2 C<< curry_head( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::head >>.

=cut

sub curry_head {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_head: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_head: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::head( $$ref, @_ ) };
}

=head2 C<< curry_insert( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::insert >>.

=cut

sub curry_insert {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_insert: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_insert: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::insert( $$ref, @_ ) };
}

=head2 C<< curry_is_empty( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::is_empty >>.

=cut

sub curry_is_empty {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_is_empty: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_is_empty: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::is_empty( $$ref, @_ ) };
}

=head2 C<< curry_join( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::join >>.

=cut

sub curry_join {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_join: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_join: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::join( $$ref, @_ ) };
}

=head2 C<< curry_map( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::map >>.

=cut

sub curry_map {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_map: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_map: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::map( $$ref, @_ ) };
}

=head2 C<< curry_max( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::max >>.

=cut

sub curry_max {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_max: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_max: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::max( $$ref, @_ ) };
}

=head2 C<< curry_maxstr( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::maxstr >>.

=cut

sub curry_maxstr {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_maxstr: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_maxstr: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::maxstr( $$ref, @_ ) };
}

=head2 C<< curry_min( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::min >>.

=cut

sub curry_min {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_min: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_min: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::min( $$ref, @_ ) };
}

=head2 C<< curry_minstr( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::minstr >>.

=cut

sub curry_minstr {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_minstr: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_minstr: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::minstr( $$ref, @_ ) };
}

=head2 C<< curry_natatime( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::natatime >>.

=cut

sub curry_natatime {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_natatime: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_natatime: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::natatime( $$ref, @_ ) };
}

=head2 C<< curry_not_all_true( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::not_all_true >>.

=cut

sub curry_not_all_true {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_not_all_true: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_not_all_true: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::not_all_true( $$ref, @_ ) };
}

=head2 C<< curry_pairfirst( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::pairfirst >>.

=cut

sub curry_pairfirst {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_pairfirst: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_pairfirst: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::pairfirst( $$ref, @_ ) };
}

=head2 C<< curry_pairgrep( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::pairgrep >>.

=cut

sub curry_pairgrep {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_pairgrep: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_pairgrep: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::pairgrep( $$ref, @_ ) };
}

=head2 C<< curry_pairkeys( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::pairkeys >>.

=cut

sub curry_pairkeys {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_pairkeys: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_pairkeys: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::pairkeys( $$ref, @_ ) };
}

=head2 C<< curry_pairmap( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::pairmap >>.

=cut

sub curry_pairmap {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_pairmap: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_pairmap: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::pairmap( $$ref, @_ ) };
}

=head2 C<< curry_pairs( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::pairs >>.

=cut

sub curry_pairs {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_pairs: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_pairs: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::pairs( $$ref, @_ ) };
}

=head2 C<< curry_pairvalues( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::pairvalues >>.

=cut

sub curry_pairvalues {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_pairvalues: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_pairvalues: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::pairvalues( $$ref, @_ ) };
}

=head2 C<< curry_pick_random( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::pick_random >>.

=cut

sub curry_pick_random {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_pick_random: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_pick_random: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::pick_random( $$ref, @_ ) };
}

=head2 C<< curry_pop( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::pop >>.

=cut

sub curry_pop {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_pop: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_pop: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::pop( $$ref, @_ ) };
}

=head2 C<< curry_print( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::print >>.

=cut

sub curry_print {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_print: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_print: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::print( $$ref, @_ ) };
}

=head2 C<< curry_product( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::product >>.

=cut

sub curry_product {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_product: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_product: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::product( $$ref, @_ ) };
}

=head2 C<< curry_push( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::push >>.

=cut

sub curry_push {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_push: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_push: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::push( $$ref, @_ ) };
}

=head2 C<< curry_reduce( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::reduce >>.

=cut

sub curry_reduce {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_reduce: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_reduce: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::reduce( $$ref, @_ ) };
}

=head2 C<< curry_reductions( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::reductions >>.

=cut

sub curry_reductions {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_reductions: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_reductions: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::reductions( $$ref, @_ ) };
}

=head2 C<< curry_reset( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::reset >>.

=cut

sub curry_reset {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_reset: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_reset: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::reset( $$ref, @_ ) };
}

=head2 C<< curry_reverse( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::reverse >>.

=cut

sub curry_reverse {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_reverse: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_reverse: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::reverse( $$ref, @_ ) };
}

=head2 C<< curry_sample( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::sample >>.

=cut

sub curry_sample {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_sample: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_sample: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::sample( $$ref, @_ ) };
}

=head2 C<< curry_set( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::set >>.

=cut

sub curry_set {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_set: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_set: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::set( $$ref, @_ ) };
}

=head2 C<< curry_shallow_clone( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::shallow_clone >>.

=cut

sub curry_shallow_clone {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_shallow_clone: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_shallow_clone: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::shallow_clone( $$ref, @_ ) };
}

=head2 C<< curry_shift( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::shift >>.

=cut

sub curry_shift {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_shift: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_shift: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::shift( $$ref, @_ ) };
}

=head2 C<< curry_shuffle( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::shuffle >>.

=cut

sub curry_shuffle {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_shuffle: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_shuffle: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::shuffle( $$ref, @_ ) };
}

=head2 C<< curry_shuffle_in_place( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::shuffle_in_place >>.

=cut

sub curry_shuffle_in_place {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_shuffle_in_place: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_shuffle_in_place: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::shuffle_in_place( $$ref, @_ ) };
}

=head2 C<< curry_sort( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::sort >>.

=cut

sub curry_sort {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_sort: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_sort: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::sort( $$ref, @_ ) };
}

=head2 C<< curry_sort_in_place( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::sort_in_place >>.

=cut

sub curry_sort_in_place {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_sort_in_place: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_sort_in_place: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::sort_in_place( $$ref, @_ ) };
}

=head2 C<< curry_splice( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::splice >>.

=cut

sub curry_splice {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_splice: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_splice: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::splice( $$ref, @_ ) };
}

=head2 C<< curry_sum( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::sum >>.

=cut

sub curry_sum {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_sum: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_sum: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::sum( $$ref, @_ ) };
}

=head2 C<< curry_tail( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::tail >>.

=cut

sub curry_tail {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_tail: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_tail: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::tail( $$ref, @_ ) };
}

=head2 C<< curry_uniq( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::uniq >>.

=cut

sub curry_uniq {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_uniq: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_uniq: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::uniq( $$ref, @_ ) };
}

=head2 C<< curry_uniq_in_place( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::uniq_in_place >>.

=cut

sub curry_uniq_in_place {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_uniq_in_place: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_uniq_in_place: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::uniq_in_place( $$ref, @_ ) };
}

=head2 C<< curry_uniqnum( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::uniqnum >>.

=cut

sub curry_uniqnum {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_uniqnum: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_uniqnum: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::uniqnum( $$ref, @_ ) };
}

=head2 C<< curry_uniqnum_in_place( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::uniqnum_in_place >>.

=cut

sub curry_uniqnum_in_place {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_uniqnum_in_place: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_uniqnum_in_place: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::uniqnum_in_place( $$ref, @_ ) };
}

=head2 C<< curry_uniqstr( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::uniqstr >>.

=cut

sub curry_uniqstr {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_uniqstr: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_uniqstr: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::uniqstr( $$ref, @_ ) };
}

=head2 C<< curry_uniqstr_in_place( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::uniqstr_in_place >>.

=cut

sub curry_uniqstr_in_place {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_uniqstr_in_place: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_uniqstr_in_place: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::uniqstr_in_place( $$ref, @_ ) };
}

=head2 C<< curry_unshift( $arrayref ) >>

Curry the first argument of C<< Hydrogen::ArrayRef::unshift >>.

=cut

sub curry_unshift {
    @_ == 1
        or Hydrogen::croak(
            "Wrong number of parameters in signature for curry_unshift: got %d, %s",
            scalar(@_), "expected exactly 1 parameter"
        );
    (ref($_[0]) eq 'ARRAY')
        or Hydrogen::croak(
            "Type check failed in signature for curry_unshift: %s should be %s",
            "\\$_[0]", "ArrayRef"
        );
    my $ref = \$_[0];
    return sub { Hydrogen::ArrayRef::unshift( $$ref, @_ ) };
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Curry::ArrayRef -all;

To import a particular function, use:

    use Hydrogen::Curry::ArrayRef 'curry_all_true';

To rename functions:

    use Hydrogen::Curry::ArrayRef 'curry_all_true' => { -as => 'myfunc' };

On Perl 5.37.2+, you can import lexically:

    use Hydrogen::Curry::ArrayRef -lexical, 'curry_all_true';

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::ArrayRef>,
L<Hydrogen::Array>,
L<Hydrogen::Topic::ArrayRef>,
L<Sub::HandlesVia::HandlerLibrary::Array>,
L<List::Util>,
L<List::MoreUtils>.

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

