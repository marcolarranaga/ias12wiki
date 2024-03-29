# configure.wps
#
# This file was automatically generated by the configure script in the
# top level directory. You may make changes to the settings in this
# file but be aware they will be overwritten each time you run configure.
# Ordinarily, it is necessary to run configure once, when the code is
# first installed.
#
# To permanently change options, change the settings for your platform
# in the file arch/configure.defaults, the preamble, and the postamble -
# then rerun configure.
#

.SUFFIXES: .F .f .c .o

SHELL               =       /bin/sh

NCARG_LIBS        =    -L$(NCARG_ROOT)/lib -lncarg -lncarg_gks -lncarg_c \
                -lX11 -lXext -lpng -lz -lcairo -lfontconfig -lpixman-1 \
                -lfreetype -lexpat -lpthread -lbz2 -lXrender -lgfortran -lgcc

NCARG_LIBS2        =    # May be overridden by architecture specific value below

FDEFS            =    -DUSE_JPEG2000 -DUSE_PNG

# Listing of options that are usually independent of machine type.
# When necessary, these are over-ridden by each architecture.

ARFLAGS            =    

PERL            =    perl

RANLIB            =    echo

WRF_DIR            =    /ccc/work/cont005/gen7298/larranam/IAS12/models/wrf/wrf4.1.3_uncoupled/

WRF_INCLUDE     =       -I$(WRF_DIR)/external/io_netcdf \
                        -I$(WRF_DIR)/external/io_grib_share \
                        -I$(WRF_DIR)/external/io_grib1 \
                        -I$(WRF_DIR)/external/io_int \
                        -I$(WRF_DIR)/inc \
                        -I$(NETCDFFORTRAN_INCDIR) \
                        -I$(NETCDF_INCDIR)


WRF_LIB         =       -L$(WRF_DIR)/external/io_grib1 -lio_grib1 \
                        -L$(WRF_DIR)/external/io_grib_share -lio_grib_share \
                        -L$(WRF_DIR)/external/io_int -lwrfio_int \
                        -L$(WRF_DIR)/external/io_netcdf -lwrfio_nf \
                        -L$(NETCDFFORTRAN_LIBDIR) -lnetcdff \
                        -L$(NETCDF_LIBDIR) -lnetcdf

#### Architecture specific settings ####

COMPRESSION_LIBS    =  # intentionally left blank, fill in COMPRESSION_LIBS below

COMPRESSION_INC        =  # intentionally left blank, fill in COMPRESSION_INC below

#
#   Settings for Linux x86_64, Intel compiler    (dmpar)
#
#
COMPRESSION_LIBS    = -L/ccc/products/ccc_users_env/compil/Atos_7__x86_64/jasper-1.900.1/intel--17.0.4.196/default/lib -ljasper -lpng -lz
COMPRESSION_INC     = -I/ccc/products/ccc_users_env/compil/Atos_7__x86_64/jasper-1.900.1/intel--17.0.4.196/default/include
FDEFS               = -DUSE_JPEG2000 -DUSE_PNG
SFC                 =  ifort
SCC                 =  icc -I$(JASPERINC)
DM_FC               =  mpifort
DM_CC               =  mpicc
FC                  =  mpifort
CC                  =  mpicc
LD                  = $(FC)
FFLAGS              = -FR -convert big_endian
F77FLAGS            = -FI -convert big_endian
FCSUFFIX            =
FNGFLAGS            = $(FFLAGS)
LDFLAGS             =
CFLAGS              = -w
CPP                 = /lib/cpp -P -traditional
CPPFLAGS            = -D_UNDERSCORE -DBYTESWAP -DLINUX -DIO_NETCDF -DIO_BINARY -DIO_GRIB1 -DBIT32 -D_MPI
ARFLAGS             =
CC_TOOLS            =

########################################################################################################################
#
#   Macros, these should be generic for all machines

LN      =   ln -sf
MAKE        =   make -i -r
RM      =   /bin/rm -f
CP      =   /bin/cp
AR      =   ar ru

.IGNORE:
.SUFFIXES: .c .f .F .o

#   There is probably no reason to modify these rules

.c.o:
    $(RM) $@
    $(CC) $(CPPFLAGS) $(CFLAGS) -c $<

.f.o:
    $(RM) $@ $*.mod
    $(FC) $(F77FLAGS) -c $< $(WRF_INCLUDE)

.F.o:
    $(RM) $@ $*.mod
    $(CPP) $(CPPFLAGS) $(FDEFS) $(WRF_INCLUDE) $< > $*.f90
    $(FC) $(FFLAGS) -c $*.f90 $(WRF_INCLUDE)
#   $(RM) $*.f90

