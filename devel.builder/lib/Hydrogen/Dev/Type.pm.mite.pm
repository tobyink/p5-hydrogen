{

    package Hydrogen::Dev::Type;
    use strict;
    use warnings;
    no warnings qw( once void );

    our $USES_MITE    = "Mite::Class";
    our $MITE_SHIM    = "Hydrogen::Dev::Mite";
    our $MITE_VERSION = "0.013000";

    # Mite keywords
    BEGIN {
        my ( $SHIM, $CALLER ) =
          ( "Hydrogen::Dev::Mite", "Hydrogen::Dev::Type" );
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
        *lock    = \&Hydrogen::Dev::Mite::lock;
        *ro      = \&Hydrogen::Dev::Mite::ro;
        *rw      = \&Hydrogen::Dev::Mite::rw;
        *rwp     = \&Hydrogen::Dev::Mite::rwp;
        *true    = \&Hydrogen::Dev::Mite::true;
        *unlock  = \&Hydrogen::Dev::Mite::unlock;
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
                map { ( *{$_}{CODE} ) ? ( *{$_}{CODE} ) : () }
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

        # Attribute dev (type: InstanceOf["Hydrogen::Dev"])
        # param declaration, file lib/Hydrogen/Dev/Type.pm, line 19
        croak "Missing key in constructor: dev" unless exists $args->{"dev"};
        blessed( $args->{"dev"} ) && $args->{"dev"}->isa("Hydrogen::Dev")
          or croak "Type check failed in constructor: %s should be %s", "dev",
          "InstanceOf[\"Hydrogen::Dev\"]";
        $self->{"dev"} = $args->{"dev"};
        require Scalar::Util && Scalar::Util::weaken( $self->{"dev"} )
          if ref $self->{"dev"};

        # Attribute type_name (type: Str)
        # param declaration, file lib/Hydrogen/Dev/Type.pm, line 20
        croak "Missing key in constructor: type_name"
          unless exists $args->{"type_name"};
        do {

            package Hydrogen::Dev::Mite;
            defined( $args->{"type_name"} ) and do {
                ref( \$args->{"type_name"} ) eq 'SCALAR'
                  or ref( \( my $val = $args->{"type_name"} ) ) eq 'SCALAR';
            }
          }
          or croak "Type check failed in constructor: %s should be %s",
          "type_name", "Str";
        $self->{"type_name"} = $args->{"type_name"};

        # Attribute is_prototyped (type: Bool)
        # param declaration, file lib/Hydrogen/Dev/Type.pm, line 21
        do {
            my $value =
              exists( $args->{"is_prototyped"} )
              ? $args->{"is_prototyped"}
              : false;
            (
                !ref $value
                  and ( !defined $value
                    or $value eq q()
                    or $value eq '0'
                    or $value eq '1' )
              )
              or croak "Type check failed in constructor: %s should be %s",
              "is_prototyped", "Bool";
            $self->{"is_prototyped"} = $value;
        };

        # Call BUILD methods
        $self->BUILDALL($args) if ( !$no_build and @{ $meta->{BUILD} || [] } );

        # Unrecognized parameters
        my @unknown = grep not(/\A(?:dev|is_prototyped|type_name)\z/),
          keys %{$args};
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

    # Accessors for code_for_default
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 23
    sub code_for_default {
        @_ == 1
          or
          croak('Reader "code_for_default" usage: $self->code_for_default()');
        (
            exists( $_[0]{"code_for_default"} )
            ? $_[0]{"code_for_default"}
            : ( $_[0]{"code_for_default"} = $_[0]->_build_code_for_default ) );
    }

    # Accessors for codegen
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 38
    sub codegen {
        @_ == 1 or croak('Reader "codegen" usage: $self->codegen()');
        (
            exists( $_[0]{"codegen"} )
            ? $_[0]{"codegen"}
            : ( $_[0]{"codegen"} = $_[0]->_build_codegen ) );
    }

    # Accessors for curry_filename
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 30
    sub curry_filename {
        @_ == 1
          or croak('Reader "curry_filename" usage: $self->curry_filename()');
        (
            exists( $_[0]{"curry_filename"} )
            ? $_[0]{"curry_filename"}
            : ( $_[0]{"curry_filename"} = $_[0]->_build_curry_filename ) );
    }

    # Accessors for curry_module
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 27
    sub curry_module {
        @_ == 1 or croak('Reader "curry_module" usage: $self->curry_module()');
        (
            exists( $_[0]{"curry_module"} )
            ? $_[0]{"curry_module"}
            : ( $_[0]{"curry_module"} = $_[0]->_build_curry_module ) );
    }

    # Accessors for curry_test_filename
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 33
    sub curry_test_filename {
        @_ == 1
          or croak(
            'Reader "curry_test_filename" usage: $self->curry_test_filename()');
        (
            exists( $_[0]{"curry_test_filename"} )
            ? $_[0]{"curry_test_filename"}
            : ( $_[0]{"curry_test_filename"} =
                  $_[0]->_build_curry_test_filename )
        );
    }

    # Accessors for dev
    # param declaration, file lib/Hydrogen/Dev/Type.pm, line 19
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "dev" => "dev" },
        );
    }
    else {
        *dev = sub {
            @_ == 1 or croak('Reader "dev" usage: $self->dev()');
            $_[0]{"dev"};
        };
    }

    # Accessors for example_var
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 25
    sub example_var {
        @_ == 1 or croak('Reader "example_var" usage: $self->example_var()');
        (
            exists( $_[0]{"example_var"} )
            ? $_[0]{"example_var"}
            : ( $_[0]{"example_var"} = $_[0]->_build_example_var ) );
    }

    # Accessors for function_names
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 36
    sub function_names {
        @_ == 1
          or croak('Reader "function_names" usage: $self->function_names()');
        (
            exists( $_[0]{"function_names"} )
            ? $_[0]{"function_names"}
            : ( $_[0]{"function_names"} = $_[0]->_build_function_names ) );
    }

    # Accessors for functions
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 37
    sub functions {
        @_ == 1 or croak('Reader "functions" usage: $self->functions()');
        (
            exists( $_[0]{"functions"} )
            ? $_[0]{"functions"}
            : ( $_[0]{"functions"} = $_[0]->_build_functions ) );
    }

    # Accessors for handler_library
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 35
    sub handler_library {
        @_ == 1
          or croak('Reader "handler_library" usage: $self->handler_library()');
        (
            exists( $_[0]{"handler_library"} )
            ? $_[0]{"handler_library"}
            : ( $_[0]{"handler_library"} = $_[0]->_build_handler_library ) );
    }

    # Accessors for is_prototyped
    # param declaration, file lib/Hydrogen/Dev/Type.pm, line 21
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "is_prototyped" => "is_prototyped" },
        );
    }
    else {
        *is_prototyped = sub {
            @_ == 1
              or croak('Reader "is_prototyped" usage: $self->is_prototyped()');
            $_[0]{"is_prototyped"};
        };
    }

    # Accessors for lctype
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 24
    sub lctype {
        @_ == 1 or croak('Reader "lctype" usage: $self->lctype()');
        (
            exists( $_[0]{"lctype"} )
            ? $_[0]{"lctype"}
            : ( $_[0]{"lctype"} = $_[0]->_build_lctype ) );
    }

    # Accessors for sandboxing_package
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 41
    sub sandboxing_package {
        @_ == 1
          or croak(
            'Reader "sandboxing_package" usage: $self->sandboxing_package()');
        (
            exists( $_[0]{"sandboxing_package"} )
            ? $_[0]{"sandboxing_package"}
            : ( $_[0]{"sandboxing_package"} = $_[0]->_build_sandboxing_package )
        );
    }

    # Accessors for target_filename
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 29
    sub target_filename {
        @_ == 1
          or croak('Reader "target_filename" usage: $self->target_filename()');
        (
            exists( $_[0]{"target_filename"} )
            ? $_[0]{"target_filename"}
            : ( $_[0]{"target_filename"} = $_[0]->_build_target_filename ) );
    }

    # Accessors for target_module
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 26
    sub target_module {
        @_ == 1
          or croak('Reader "target_module" usage: $self->target_module()');
        (
            exists( $_[0]{"target_module"} )
            ? $_[0]{"target_module"}
            : ( $_[0]{"target_module"} = $_[0]->_build_target_module ) );
    }

    # Accessors for test_filename
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 32
    sub test_filename {
        @_ == 1
          or croak('Reader "test_filename" usage: $self->test_filename()');
        (
            exists( $_[0]{"test_filename"} )
            ? $_[0]{"test_filename"}
            : ( $_[0]{"test_filename"} = $_[0]->_build_test_filename ) );
    }

    # Accessors for topic_codegen
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 39
    sub topic_codegen {
        @_ == 1
          or croak('Reader "topic_codegen" usage: $self->topic_codegen()');
        (
            exists( $_[0]{"topic_codegen"} )
            ? $_[0]{"topic_codegen"}
            : ( $_[0]{"topic_codegen"} = $_[0]->_build_topic_codegen ) );
    }

    # Accessors for topic_filename
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 31
    sub topic_filename {
        @_ == 1
          or croak('Reader "topic_filename" usage: $self->topic_filename()');
        (
            exists( $_[0]{"topic_filename"} )
            ? $_[0]{"topic_filename"}
            : ( $_[0]{"topic_filename"} = $_[0]->_build_topic_filename ) );
    }

    # Accessors for topic_module
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 28
    sub topic_module {
        @_ == 1 or croak('Reader "topic_module" usage: $self->topic_module()');
        (
            exists( $_[0]{"topic_module"} )
            ? $_[0]{"topic_module"}
            : ( $_[0]{"topic_module"} = $_[0]->_build_topic_module ) );
    }

    # Accessors for topic_test_filename
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 34
    sub topic_test_filename {
        @_ == 1
          or croak(
            'Reader "topic_test_filename" usage: $self->topic_test_filename()');
        (
            exists( $_[0]{"topic_test_filename"} )
            ? $_[0]{"topic_test_filename"}
            : ( $_[0]{"topic_test_filename"} =
                  $_[0]->_build_topic_test_filename )
        );
    }

    # Accessors for type_constraint
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 40
    sub type_constraint {
        @_ == 1
          or croak('Reader "type_constraint" usage: $self->type_constraint()');
        (
            exists( $_[0]{"type_constraint"} )
            ? $_[0]{"type_constraint"}
            : ( $_[0]{"type_constraint"} = $_[0]->_build_type_constraint ) );
    }

    # Accessors for type_desc_for_abstract
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 42
    sub type_desc_for_abstract {
        @_ == 1
          or croak(
'Reader "type_desc_for_abstract" usage: $self->type_desc_for_abstract()'
          );
        (
            exists( $_[0]{"type_desc_for_abstract"} )
            ? $_[0]{"type_desc_for_abstract"}
            : ( $_[0]{"type_desc_for_abstract"} =
                  $_[0]->_build_type_desc_for_abstract )
        );
    }

    # Accessors for type_desc_for_functions
    # field declaration, file lib/Hydrogen/Dev/Type.pm, line 43
    sub type_desc_for_functions {
        @_ == 1
          or croak(
'Reader "type_desc_for_functions" usage: $self->type_desc_for_functions()'
          );
        (
            exists( $_[0]{"type_desc_for_functions"} )
            ? $_[0]{"type_desc_for_functions"}
            : ( $_[0]{"type_desc_for_functions"} =
                  $_[0]->_build_type_desc_for_functions )
        );
    }

    # Accessors for type_name
    # param declaration, file lib/Hydrogen/Dev/Type.pm, line 20
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "type_name" => "type_name" },
        );
    }
    else {
        *type_name = sub {
            @_ == 1 or croak('Reader "type_name" usage: $self->type_name()');
            $_[0]{"type_name"};
        };
    }

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
