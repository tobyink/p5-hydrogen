# This file was autogenerated.
use 5.008008;
use strict;
use warnings;
no warnings qw( void once );
use Hydrogen ();

package Hydrogen::Number;

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.007';

=head1 NAME

Hydrogen::Number - a standard library for numbers

=head1 VERSION

This documentation is for Hydrogen::Number 0.007.

=cut

=head1 FUNCTIONS

Each function expects a numeric scalar as its first argument.

=cut

use Exporter::Shiny qw(
    abs
    add
    cmp
    div
    eq
    ge
    get
    gt
    le
    lt
    mod
    mul
    ne
    set
    sub
);

=head2 C<< abs( $number ) >>

Finds the absolute value of the current number, updating the original value.

=cut

sub abs {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for abs; usage: "
          . "Hydrogen::Number::abs( \$number )" );
    1;
    ( ${$__REF__} = abs($$__REF__) );
}

=head2 C<< add( $number, $addend ) >>

Additional arguments: B<< Num >>.

Adds a number to the existing number, updating the original value.

=cut

sub add {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "add", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for add: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for add: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    (
        ${$__REF__} = do {
            my $shv_final_unchecked = $$__REF__ + $_[1];
            do {
                (
                    do {

                        package Hydrogen::Number::__SANDBOX__;
                        use Scalar::Util ();
                        defined($shv_final_unchecked)
                          && !ref($shv_final_unchecked)
                          && Scalar::Util::looks_like_number(
                            $shv_final_unchecked);
                    }
                  )
                  or Hydrogen::croak(
                    "Type check failed for add: expected %s, got value %s",
                    "Num", $shv_final_unchecked );
                $shv_final_unchecked;
            };
        }
    );
}

=head2 C<< cmp( $number, $num ) >>

Additional arguments: B<< Num >>.

Returns C<< $number <=> $num >>.

=cut

sub cmp {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "cmp", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for cmp: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for cmp: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    $$__REF__ <=> $_[1];
}

=head2 C<< div( $number, $divisor ) >>

Additional arguments: B<< Num >>.

Divides the existing number by a number, updating the original value.

=cut

sub div {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "div", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for div: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for div: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    (
        ${$__REF__} = do {
            my $shv_final_unchecked = $$__REF__ / $_[1];
            do {
                (
                    do {

                        package Hydrogen::Number::__SANDBOX__;
                        use Scalar::Util ();
                        defined($shv_final_unchecked)
                          && !ref($shv_final_unchecked)
                          && Scalar::Util::looks_like_number(
                            $shv_final_unchecked);
                    }
                  )
                  or Hydrogen::croak(
                    "Type check failed for div: expected %s, got value %s",
                    "Num", $shv_final_unchecked );
                $shv_final_unchecked;
            };
        }
    );
}

=head2 C<< eq( $number, $num ) >>

Additional arguments: B<< Num >>.

Returns C<< $number == $num >>.

=cut

sub eq {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "eq", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for eq: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for eq: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    $$__REF__ == $_[1];
}

=head2 C<< ge( $number, $num ) >>

Additional arguments: B<< Num >>.

Returns C<< $number >= $num >>.

=cut

sub ge {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "ge", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for ge: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for ge: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    $$__REF__ >= $_[1];
}

=head2 C<< get( $number ) >>

Returns the current value of the number.

=cut

sub get {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ == 1
      or Hydrogen::croak( "Wrong number of parameters for get; usage: "
          . "Hydrogen::Number::get( \$number )" );
    $$__REF__;
}

=head2 C<< gt( $number, $num ) >>

Additional arguments: B<< Num >>.

Returns C<< $number > $num >>.

=cut

sub gt {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "gt", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for gt: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for gt: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    $$__REF__ > $_[1];
}

=head2 C<< le( $number, $num ) >>

Additional arguments: B<< Num >>.

Returns C<< $number <= $num >>.

=cut

sub le {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "le", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for le: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for le: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    $$__REF__ <= $_[1];
}

=head2 C<< lt( $number, $num ) >>

Additional arguments: B<< Num >>.

Returns C<< $number < $num >>.

=cut

sub lt {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "lt", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for lt: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for lt: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    $$__REF__ < $_[1];
}

=head2 C<< mod( $number, $divisor ) >>

Additional arguments: B<< Num >>.

Finds the current number modulo a divisor, updating the original value.

=cut

sub mod {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "mod", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for mod: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for mod: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    (
        ${$__REF__} = do {
            my $shv_final_unchecked = $$__REF__ % $_[1];
            do {
                (
                    do {

                        package Hydrogen::Number::__SANDBOX__;
                        use Scalar::Util ();
                        defined($shv_final_unchecked)
                          && !ref($shv_final_unchecked)
                          && Scalar::Util::looks_like_number(
                            $shv_final_unchecked);
                    }
                  )
                  or Hydrogen::croak(
                    "Type check failed for mod: expected %s, got value %s",
                    "Num", $shv_final_unchecked );
                $shv_final_unchecked;
            };
        }
    );
}

=head2 C<< mul( $number, $factor ) >>

Additional arguments: B<< Num >>.

Multiplies the existing number by a number, updating the original value.

=cut

sub mul {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "mul", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for mul: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for mul: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    (
        ${$__REF__} = do {
            my $shv_final_unchecked = $$__REF__ * $_[1];
            do {
                (
                    do {

                        package Hydrogen::Number::__SANDBOX__;
                        use Scalar::Util ();
                        defined($shv_final_unchecked)
                          && !ref($shv_final_unchecked)
                          && Scalar::Util::looks_like_number(
                            $shv_final_unchecked);
                    }
                  )
                  or Hydrogen::croak(
                    "Type check failed for mul: expected %s, got value %s",
                    "Num", $shv_final_unchecked );
                $shv_final_unchecked;
            };
        }
    );
}

=head2 C<< ne( $number, $num ) >>

Additional arguments: B<< Num >>.

Returns C<< $number != $num >>.

=cut

sub ne {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "ne", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for ne: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for ne: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    $$__REF__ != $_[1];
}

=head2 C<< set( $number, $value ) >>

Additional arguments: B<< Num >>.

Sets the number to a new value.

=cut

sub set {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "set", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for set: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for set: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    (
        ${$__REF__} = do {
            my $shv_final_unchecked = $_[1];
            do {
                (
                    do {

                        package Hydrogen::Number::__SANDBOX__;
                        use Scalar::Util ();
                        defined($shv_final_unchecked)
                          && !ref($shv_final_unchecked)
                          && Scalar::Util::looks_like_number(
                            $shv_final_unchecked);
                    }
                  )
                  or Hydrogen::croak(
                    "Type check failed for set: expected %s, got value %s",
                    "Num", $shv_final_unchecked );
                $shv_final_unchecked;
            };
        }
    );
}

=head2 C<< sub( $number, $subtrahend ) >>

Additional arguments: B<< Num >>.

Subtracts a number from the existing number, updating the original value.

=cut

sub sub {
    my $__REF__ = \$_[0];

    package Hydrogen::Number::__SANDBOX__;
    @_ = do {
        my ( %tmp, $tmp );

        @_ == 2
          or Hydrogen::croak(
            "Wrong number of parameters in signature for %s: got %d, %s",
            "sub", scalar(@_), "expected exactly 2 parameters" );

        # Parameter $_[0] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[0] )
                  && !ref( $_[0] )
                  && Scalar::Util::looks_like_number( $_[0] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for sub: %s should be %s",
            "\$_[0]", "Num" );

        # Parameter $_[1] (type: Num)
        (
            do {

                package Hydrogen::Number::__SANDBOX__;
                use Scalar::Util ();
                defined( $_[1] )
                  && !ref( $_[1] )
                  && Scalar::Util::looks_like_number( $_[1] );
            }
          )
          or Hydrogen::croak(
            "Type check failed in signature for sub: %s should be %s",
            "\$_[1]", "Num" );

        (@_);
    };
    (
        ${$__REF__} = do {
            my $shv_final_unchecked = $$__REF__ - $_[1];
            do {
                (
                    do {

                        package Hydrogen::Number::__SANDBOX__;
                        use Scalar::Util ();
                        defined($shv_final_unchecked)
                          && !ref($shv_final_unchecked)
                          && Scalar::Util::looks_like_number(
                            $shv_final_unchecked);
                    }
                  )
                  or Hydrogen::croak(
                    "Type check failed for sub: expected %s, got value %s",
                    "Num", $shv_final_unchecked );
                $shv_final_unchecked;
            };
        }
    );
}

1;

=head1 EXPORT

No functions are exported by this module by default. To import them all
(this is usually a bad idea), use:

    use Hydrogen::Number -all;

To import a particular function, use:

    use Hydrogen::Number 'cmp';

To rename functions:

    use Hydrogen::Number 'cmp' => { -as => 'myfunc' };

See L<Exporter::Tiny::Manual::Importing> for more hints on importing.

=head1 BUGS

Please report any bugs to
L<http://github.com/tobyink/p5-hydrogen/issues>.

=head1 SEE ALSO

L<Hydrogen>,
L<Hydrogen::Curry::Number>,
L<Hydrogen::Topic::Number>,
L<Sub::HandlesVia::HandlerLibrary::Number>.

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


