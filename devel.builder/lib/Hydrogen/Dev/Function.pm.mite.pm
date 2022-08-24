{

    package Hydrogen::Dev::Function;
    use strict;
    use warnings;
    no warnings qw( once void );

    our $USES_MITE    = "Mite::Class";
    our $MITE_SHIM    = "Hydrogen::Dev::Mite";
    our $MITE_VERSION = "0.010008";

    # Mite keywords
    BEGIN {
        my ( $SHIM, $CALLER ) =
          ( "Hydrogen::Dev::Mite", "Hydrogen::Dev::Function" );
        (
            *after, *around, *before,        *extends, *field,
            *has,   *param,  *signature_for, *with
          )
          = do {

            package Hydrogen::Dev::Mite;
            no warnings 'redefine';
            (
                sub { $SHIM->HANDLE_after( $CALLER, "class", @_ ) },
                sub { $SHIM->HANDLE_around( $CALLER, "class", @_ ) },
                sub { $SHIM->HANDLE_before( $CALLER, "class", @_ ) },
                sub { },
                sub { $SHIM->HANDLE_has( $CALLER, field => @_ ) },
                sub { $SHIM->HANDLE_has( $CALLER, has   => @_ ) },
                sub { $SHIM->HANDLE_has( $CALLER, param => @_ ) },
                sub { $SHIM->HANDLE_signature_for( $CALLER, "class", @_ ) },
                sub { $SHIM->HANDLE_with( $CALLER, @_ ) },
            );
          };
    }

    # Mite imports
    BEGIN {
        require Scalar::Util;
        *STRICT  = \&Hydrogen::Dev::Mite::STRICT;
        *bare    = \&Hydrogen::Dev::Mite::bare;
        *blessed = \&Scalar::Util::blessed;
        *carp    = \&Hydrogen::Dev::Mite::carp;
        *confess = \&Hydrogen::Dev::Mite::confess;
        *croak   = \&Hydrogen::Dev::Mite::croak;
        *false   = \&Hydrogen::Dev::Mite::false;
        *guard   = \&Hydrogen::Dev::Mite::guard;
        *lazy    = \&Hydrogen::Dev::Mite::lazy;
        *ro      = \&Hydrogen::Dev::Mite::ro;
        *rw      = \&Hydrogen::Dev::Mite::rw;
        *rwp     = \&Hydrogen::Dev::Mite::rwp;
        *true    = \&Hydrogen::Dev::Mite::true;
    }

    # Gather metadata for constructor and destructor
    sub __META__ {
        no strict 'refs';
        my $class = shift;
        $class = ref($class) || $class;
        my $linear_isa = mro::get_linear_isa($class);
        return {
            BUILD => [
                map { ( *{$_}{CODE} ) ? ( *{$_}{CODE} ) : () }
                map { "$_\::BUILD" } reverse @$linear_isa
            ],
            DEMOLISH => [
                map   { ( *{$_}{CODE} ) ? ( *{$_}{CODE} ) : () }
                  map { "$_\::DEMOLISH" } @$linear_isa
            ],
            HAS_BUILDARGS        => $class->can('BUILDARGS'),
            HAS_FOREIGNBUILDARGS => $class->can('FOREIGNBUILDARGS'),
        };
    }

    # Standard Moose/Moo-style constructor
    sub new {
        my $class = ref( $_[0] ) ? ref(shift) : shift;
        my $meta  = ( $Mite::META{$class} ||= $class->__META__ );
        my $self  = bless {}, $class;
        my $args =
            $meta->{HAS_BUILDARGS}
          ? $class->BUILDARGS(@_)
          : { ( @_ == 1 ) ? %{ $_[0] } : @_ };
        my $no_build = delete $args->{__no_BUILD__};

        # Attribute function_name (type: Str)
        # param declaration, file lib/Hydrogen/Dev/Function.pm, line 14
        croak "Missing key in constructor: function_name"
          unless exists $args->{"function_name"};
        do {

            package Hydrogen::Dev::Mite;
            defined( $args->{"function_name"} ) and do {
                ref( \$args->{"function_name"} ) eq 'SCALAR'
                  or ref( \( my $val = $args->{"function_name"} ) ) eq 'SCALAR';
            }
          }
          or croak "Type check failed in constructor: %s should be %s",
          "function_name", "Str";
        $self->{"function_name"} = $args->{"function_name"};

        # Attribute type (type: InstanceOf["Hydrogen::Dev::Type"])
        # param declaration, file lib/Hydrogen/Dev/Function.pm, line 15
        croak "Missing key in constructor: type" unless exists $args->{"type"};
        blessed( $args->{"type"} )
          && $args->{"type"}->isa("Hydrogen::Dev::Type")
          or croak "Type check failed in constructor: %s should be %s", "type",
          "InstanceOf[\"Hydrogen::Dev::Type\"]";
        $self->{"type"} = $args->{"type"};
        require Scalar::Util && Scalar::Util::weaken( $self->{"type"} )
          if ref $self->{"type"};

        # Call BUILD methods
        $self->BUILDALL($args) if ( !$no_build and @{ $meta->{BUILD} || [] } );

        # Unrecognized parameters
        my @unknown = grep not(/\A(?:function_name|type)\z/), keys %{$args};
        @unknown
          and croak(
            "Unexpected keys in constructor: " . join( q[, ], sort @unknown ) );

        return $self;
    }

    # Used by constructor to call BUILD methods
    sub BUILDALL {
        my $class = ref( $_[0] );
        my $meta  = ( $Mite::META{$class} ||= $class->__META__ );
        $_->(@_) for @{ $meta->{BUILD} || [] };
    }

    # Destructor should call DEMOLISH methods
    sub DESTROY {
        my $self  = shift;
        my $class = ref($self) || $self;
        my $meta  = ( $Mite::META{$class} ||= $class->__META__ );
        my $in_global_destruction =
          defined ${^GLOBAL_PHASE}
          ? ${^GLOBAL_PHASE} eq 'DESTRUCT'
          : Devel::GlobalDestruction::in_global_destruction();
        for my $demolisher ( @{ $meta->{DEMOLISH} || [] } ) {
            my $e = do {
                local ( $?, $@ );
                eval { $demolisher->( $self, $in_global_destruction ) };
                $@;
            };
            no warnings 'misc';    # avoid (in cleanup) warnings
            die $e if $e;          # rethrow
        }
        return;
    }

    my $__XS = !$ENV{PERL_ONLY}
      && eval { require Class::XSAccessor; Class::XSAccessor->VERSION("1.19") };

    # Accessors for function_name
    # param declaration, file lib/Hydrogen/Dev/Function.pm, line 14
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "function_name" => "function_name" },
        );
    }
    else {
        *function_name = sub {
            @_ == 1
              or croak('Reader "function_name" usage: $self->function_name()');
            $_[0]{"function_name"};
        };
    }

    # Accessors for handler
    # field declaration, file lib/Hydrogen/Dev/Function.pm, line 17
    sub handler {
        @_ == 1 or croak('Reader "handler" usage: $self->handler()');
        (
            exists( $_[0]{"handler"} )
            ? $_[0]{"handler"}
            : ( $_[0]{"handler"} = $_[0]->_build_handler ) );
    }

    # Accessors for type
    # param declaration, file lib/Hydrogen/Dev/Function.pm, line 15
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "type" => "type" },
        );
    }
    else {
        *type = sub {
            @_ == 1 or croak('Reader "type" usage: $self->type()');
            $_[0]{"type"};
        };
    }

    sub _assert_blessed_type {
        my $object = do { $_[0]{"type"} };
        blessed($object) or croak("type is not a blessed object");
        $object;
    }

    # Delegated methods for type
    # param declaration, file lib/Hydrogen/Dev/Function.pm, line 15
    sub dev       { shift->_assert_blessed_type->dev(@_) }
    sub type_name { shift->_assert_blessed_type->type_name(@_) }

    # See UNIVERSAL
    sub DOES {
        my ( $self, $role ) = @_;
        our %DOES;
        return $DOES{$role} if exists $DOES{$role};
        return 1            if $role eq __PACKAGE__;
        if ( $INC{'Moose/Util.pm'}
            and my $meta = Moose::Util::find_meta( ref $self or $self ) )
        {
            $meta->can('does_role') and $meta->does_role($role) and return 1;
        }
        return $self->SUPER::DOES($role);
    }

    # Alias for Moose/Moo-compatibility
    sub does {
        shift->DOES(@_);
    }

    1;
}
