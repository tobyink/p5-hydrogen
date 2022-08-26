# This file was autogenerated.
use 5.008001;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Topic::Counter;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.012';

=head1 NAME

Hydrogen::Topic::Counter - functions from Hydrogen::Counter applied to C<$_>

=head1 VERSION

This documentation is for Hydrogen::Topic::Counter 0.012,
which is based on Sub::HandlesVia::HandlerLibrary::Counter 0.036.

=cut

=head1 FUNCTIONS

Each function implicitly operates on C<< $_ >>, expecting it to be an integer.

=cut

use Exporter::Shiny qw(
    dec
    inc
    reset
    set
);

=head2 C<< dec( $amount? ) >>

Operates on C<< $_ >>, which must be an integer.

Arguments: B<< Optional[Int] >>.

Decrements the counter by C<< $amount >>, or by 1 if no value is given.

=cut

{
    my $__signature;

    sub dec {

        package Hydrogen::Counter::__SANDBOX__;
        $__signature ||= sub {
            my ( %tmp, $tmp );

            @_ >= 0
              or Hydrogen::croak(
                "Wrong number of parameters in signature for %s: got %d, %s",
                "dec", scalar(@_), "expected exactly 0 parameters" );

            # Parameter $_[0] (type: Optional[Int])
            $#_ >= 0
              or return (@_);
            (
                do {
                    my $tmp = $_[0];
                    defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/;
                }
              )
              or Hydrogen::croak(
                "Type check failed in signature for dec: %s should be %s",
                "\$_[0]", "Optional[Int]" );

            (@_);
        };
        @_ = &$__signature;
        (
            $_ = do {
                my $shv_final_unchecked = $_ - ( ( 0 + @_ ) ? $_[0] : 1 );
                do {
                    (
                        do {
                            my $tmp = $shv_final_unchecked;
                            defined($tmp)
                              and !ref($tmp)
                              and $tmp =~ /\A-?[0-9]+\z/;
                        }
                      )
                      or Hydrogen::croak(
                        "Type check failed for dec: expected %s, got value %s",
                        "Int", $shv_final_unchecked
                      );
                    $shv_final_unchecked;
                };
            }
        );
    }
}

=head2 C<< inc( $amount? ) >>

Operates on C<< $_ >>, which must be an integer.

Arguments: B<< Optional[Int] >>.

Increments the counter by C<< $amount >>, or by 1 if no value is given.

=cut

{
    my $__signature;

    sub inc {

        package Hydrogen::Counter::__SANDBOX__;
        $__signature ||= sub {
            my ( %tmp, $tmp );

            @_ >= 0
              or Hydrogen::croak(
                "Wrong number of parameters in signature for %s: got %d, %s",
                "inc", scalar(@_), "expected exactly 0 parameters" );

            # Parameter $_[0] (type: Optional[Int])
            $#_ >= 0
              or return (@_);
            (
                do {
                    my $tmp = $_[0];
                    defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/;
                }
              )
              or Hydrogen::croak(
                "Type check failed in signature for inc: %s should be %s",
                "\$_[0]", "Optional[Int]" );

            (@_);
        };
        @_ = &$__signature;
        (
            $_ = do {
                my $shv_final_unchecked = $_ + ( ( 0 + @_ ) ? $_[0] : 1 );
                do {
                    (
                        do {
                            my $tmp = $shv_final_unchecked;
                            defined($tmp)
                              and !ref($tmp)
                              and $tmp =~ /\A-?[0-9]+\z/;
                        }
                      )
                      or Hydrogen::croak(
                        "Type check failed for inc: expected %s, got value %s",
                        "Int", $shv_final_unchecked
                      );
                    $shv_final_unchecked;
                };
            }
        );
    }
}

=head2 C<< reset() >>

Operates on C<< $_ >>, which must be an integer.

Sets the counter to its default value, or 0 if it has no default.

=cut

sub reset {

    package Hydrogen::Counter::__SANDBOX__;
    @_ == 0
      or Hydrogen::croak( "Wrong number of parameters for reset; usage: "
          . "Hydrogen::Topic::Counter::reset()" );
    (
        $_ = do {
            my $shv_final_unchecked = 0;
            do {
                (
                    do {
                        my $tmp = $shv_final_unchecked;
                        defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/;
                    }
                  )
                  or Hydrogen::croak(
                    "Type check failed for reset: expected %s, got value %s",
                    "Int", $shv_final_unchecked );
                $shv_final_unchecked;
            };
        }
    );
}

=head2 C<< set( $value ) >>

Operates on C<< $_ >>, which must be an integer.

Arguments: B<< Int >>.

Sets the counter to the given value.

=cut

sub set {

    package Hydrogen::Counter::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 1
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "set", scalar(@_), "expected exactly 1 parameters" );

        # Parameter $_[0] (type: Int)
        (
            do {
                my $tmp = $_[0];
                defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/;
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for set: %s should be %s",
            "\$_[0]", "Int" );

        (@_);
    };
    (
        $_ = do {
            my $shv_final_unchecked = $_[0];
            do {
                (
                    do {
                        my $tmp = $shv_final_unchecked;
                        defined($tmp) and !ref($tmp) and $tmp =~ /\A-?[0-9]+\z/;
                    }
                  )
                  or Hydrogen::croak(
                    "Type check failed for set: expected %s, got value %s",
                    "Int", $shv_final_unchecked );
                $shv_final_unchecked;
            };
        }
    );
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all (this is usually a bad idea), use:

    use Hydrogen::Topic::Counter -all;

To import a particular function, use:

    use Hydrogen::Topic::Counter 'reset';

To rename functions:

    use Hydrogen::Topic::Counter 'reset' => { -as => 'myfunc' };

On Perl 5.37.2+, you can import lexically:

    use Hydrogen::Topic::Counter -lexical, 'reset';

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Counter>,
L<Hydrogen::Curry::Counter>,
L<Sub::HandlesVia::HandlerLibrary::Counter>.

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

