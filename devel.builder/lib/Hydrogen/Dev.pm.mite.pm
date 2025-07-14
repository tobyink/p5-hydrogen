{

    package Hydrogen::Dev;
    use strict;
    use warnings;
    no warnings qw( once void );

    our $USES_MITE    = "Mite::Class";
    our $MITE_SHIM    = "Hydrogen::Dev::Mite";
    our $MITE_VERSION = "0.013000";

    # Mite keywords
    BEGIN {
        my ( $SHIM, $CALLER ) = ( "Hydrogen::Dev::Mite", "Hydrogen::Dev" );
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

        # Attribute author_cpanid (type: Str)
        # param declaration, file lib/Hydrogen/Dev.pm, line 14
        do {
            my $value =
              exists( $args->{"author_cpanid"} )
              ? $args->{"author_cpanid"}
              : "tobyink";
            do {

                package Hydrogen::Dev::Mite;
                defined($value) and do {
                    ref( \$value ) eq 'SCALAR'
                      or ref( \( my $val = $value ) ) eq 'SCALAR';
                }
              }
              or croak "Type check failed in constructor: %s should be %s",
              "author_cpanid", "Str";
            $self->{"author_cpanid"} = $value;
        };

        # Attribute author_name (type: Str)
        # param declaration, file lib/Hydrogen/Dev.pm, line 15
        do {
            my $value =
              exists( $args->{"author_name"} )
              ? $args->{"author_name"}
              : "Toby Inkster";
            do {

                package Hydrogen::Dev::Mite;
                defined($value) and do {
                    ref( \$value ) eq 'SCALAR'
                      or ref( \( my $val = $value ) ) eq 'SCALAR';
                }
              }
              or croak "Type check failed in constructor: %s should be %s",
              "author_name", "Str";
            $self->{"author_name"} = $value;
        };

        # Attribute copyright_years (type: Str)
        # param declaration, file lib/Hydrogen/Dev.pm, line 16
        do {
            my $value =
              exists( $args->{"copyright_years"} )
              ? $args->{"copyright_years"}
              : "2022-2025";
            do {

                package Hydrogen::Dev::Mite;
                defined($value) and do {
                    ref( \$value ) eq 'SCALAR'
                      or ref( \( my $val = $value ) ) eq 'SCALAR';
                }
              }
              or croak "Type check failed in constructor: %s should be %s",
              "copyright_years", "Str";
            $self->{"copyright_years"} = $value;
        };

        # Attribute target_version (type: Str)
        # param declaration, file lib/Hydrogen/Dev.pm, line 17
        do {
            my $value =
              exists( $args->{"target_version"} )
              ? $args->{"target_version"}
              : $self->_build_target_version;
            do {

                package Hydrogen::Dev::Mite;
                defined($value) and do {
                    ref( \$value ) eq 'SCALAR'
                      or ref( \( my $val = $value ) ) eq 'SCALAR';
                }
              }
              or croak "Type check failed in constructor: %s should be %s",
              "target_version", "Str";
            $self->{"target_version"} = $value;
        };

        # Attribute bug_tracker (type: Str)
        # param declaration, file lib/Hydrogen/Dev.pm, line 18
        do {
            my $value =
              exists( $args->{"bug_tracker"} )
              ? $args->{"bug_tracker"}
              : "http://github.com/tobyink/p5-hydrogen/issues";
            do {

                package Hydrogen::Dev::Mite;
                defined($value) and do {
                    ref( \$value ) eq 'SCALAR'
                      or ref( \( my $val = $value ) ) eq 'SCALAR';
                }
              }
              or croak "Type check failed in constructor: %s should be %s",
              "bug_tracker", "Str";
            $self->{"bug_tracker"} = $value;
        };

        # Attribute target_namespace (type: Str)
        # param declaration, file lib/Hydrogen/Dev.pm, line 19
        do {
            my $value =
              exists( $args->{"target_namespace"} )
              ? $args->{"target_namespace"}
              : "Hydrogen";
            do {

                package Hydrogen::Dev::Mite;
                defined($value) and do {
                    ref( \$value ) eq 'SCALAR'
                      or ref( \( my $val = $value ) ) eq 'SCALAR';
                }
              }
              or croak "Type check failed in constructor: %s should be %s",
              "target_namespace", "Str";
            $self->{"target_namespace"} = $value;
        };

        # Attribute target_directory (type: Str)
        # param declaration, file lib/Hydrogen/Dev.pm, line 20
        do {
            my $value =
              exists( $args->{"target_directory"} )
              ? $args->{"target_directory"}
              : "lib";
            do {

                package Hydrogen::Dev::Mite;
                defined($value) and do {
                    ref( \$value ) eq 'SCALAR'
                      or ref( \( my $val = $value ) ) eq 'SCALAR';
                }
              }
              or croak "Type check failed in constructor: %s should be %s",
              "target_directory", "Str";
            $self->{"target_directory"} = $value;
        };

        # Attribute test_directory (type: Str)
        # param declaration, file lib/Hydrogen/Dev.pm, line 21
        do {
            my $value =
              exists( $args->{"test_directory"} )
              ? $args->{"test_directory"}
              : "t/unit";
            do {

                package Hydrogen::Dev::Mite;
                defined($value) and do {
                    ref( \$value ) eq 'SCALAR'
                      or ref( \( my $val = $value ) ) eq 'SCALAR';
                }
              }
              or croak "Type check failed in constructor: %s should be %s",
              "test_directory", "Str";
            $self->{"test_directory"} = $value;
        };

        # Call BUILD methods
        $self->BUILDALL($args) if ( !$no_build and @{ $meta->{BUILD} || [] } );

        # Unrecognized parameters
        my @unknown = grep not(
/\A(?:author_(?:cpanid|name)|bug_tracker|copyright_years|t(?:arget_(?:directory|namespace|version)|est_directory))\z/
        ), keys %{$args};
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

    # Accessors for author_cpanid
    # param declaration, file lib/Hydrogen/Dev.pm, line 14
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "author_cpanid" => "author_cpanid" },
        );
    }
    else {
        *author_cpanid = sub {
            @_ == 1
              or croak('Reader "author_cpanid" usage: $self->author_cpanid()');
            $_[0]{"author_cpanid"};
        };
    }

    # Accessors for author_name
    # param declaration, file lib/Hydrogen/Dev.pm, line 15
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "author_name" => "author_name" },
        );
    }
    else {
        *author_name = sub {
            @_ == 1
              or croak('Reader "author_name" usage: $self->author_name()');
            $_[0]{"author_name"};
        };
    }

    # Accessors for bug_tracker
    # param declaration, file lib/Hydrogen/Dev.pm, line 18
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "bug_tracker" => "bug_tracker" },
        );
    }
    else {
        *bug_tracker = sub {
            @_ == 1
              or croak('Reader "bug_tracker" usage: $self->bug_tracker()');
            $_[0]{"bug_tracker"};
        };
    }

    # Accessors for copyright_years
    # param declaration, file lib/Hydrogen/Dev.pm, line 16
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "copyright_years" => "copyright_years" },
        );
    }
    else {
        *copyright_years = sub {
            @_ == 1
              or
              croak('Reader "copyright_years" usage: $self->copyright_years()');
            $_[0]{"copyright_years"};
        };
    }

    # Accessors for reference_types
    # field declaration, file lib/Hydrogen/Dev.pm, line 24
    sub reference_types {
        @_ == 1
          or croak('Reader "reference_types" usage: $self->reference_types()');
        (
            exists( $_[0]{"reference_types"} ) ? $_[0]{"reference_types"} : (
                $_[0]{"reference_types"} = do {
                    my $default_value = $_[0]->_build_reference_types;
                    ( ref($default_value) eq 'ARRAY' )
                      or croak( "Type check failed in default: %s should be %s",
                        "reference_types", "ArrayRef" );
                    $default_value;
                }
            )
        );
    }

    # Accessors for target_directory
    # param declaration, file lib/Hydrogen/Dev.pm, line 20
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "target_directory" => "target_directory" },
        );
    }
    else {
        *target_directory = sub {
            @_ == 1
              or croak(
                'Reader "target_directory" usage: $self->target_directory()');
            $_[0]{"target_directory"};
        };
    }

    # Accessors for target_namespace
    # param declaration, file lib/Hydrogen/Dev.pm, line 19
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "target_namespace" => "target_namespace" },
        );
    }
    else {
        *target_namespace = sub {
            @_ == 1
              or croak(
                'Reader "target_namespace" usage: $self->target_namespace()');
            $_[0]{"target_namespace"};
        };
    }

    # Accessors for target_version
    # param declaration, file lib/Hydrogen/Dev.pm, line 17
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "target_version" => "target_version" },
        );
    }
    else {
        *target_version = sub {
            @_ == 1
              or
              croak('Reader "target_version" usage: $self->target_version()');
            $_[0]{"target_version"};
        };
    }

    # Accessors for test_directory
    # param declaration, file lib/Hydrogen/Dev.pm, line 21
    if ($__XS) {
        Class::XSAccessor->import(
            chained   => 1,
            "getters" => { "test_directory" => "test_directory" },
        );
    }
    else {
        *test_directory = sub {
            @_ == 1
              or
              croak('Reader "test_directory" usage: $self->test_directory()');
            $_[0]{"test_directory"};
        };
    }

    # Accessors for types
    # field declaration, file lib/Hydrogen/Dev.pm, line 23
    sub types {
        @_ == 1 or croak('Reader "types" usage: $self->types()');
        (
            exists( $_[0]{"types"} ) ? $_[0]{"types"} : (
                $_[0]{"types"} = do {
                    my $default_value = $_[0]->_build_types;
                    ( ref($default_value) eq 'ARRAY' )
                      or croak( "Type check failed in default: %s should be %s",
                        "types", "ArrayRef" );
                    $default_value;
                }
            )
        );
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
