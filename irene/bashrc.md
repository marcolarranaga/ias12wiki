## .bashrc

```bash
# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias cdworkleg='cd /ccc/work/cont005/legos/legos'
alias cdscrleg='cd /ccc/scratch/cont005/legos/legos'
alias cdstoreleg='cd /ccc/store/cont005/legos/legos'
alias cdwork='cd /ccc/work/cont005/gen7298/larranam' # Cambair estos tres
alias cdscr='cd /ccc/scratch/cont005/gen7298/larranam'
alias cdstore='cd /ccc/store/cont005/gen7298/larranam'

alias one='ccc_mprun -A gen7298  -p skylake -n1 -T3600 -K' #

module load intel/17.0.6.256
module load mpi/openmpi/2.0.4
module load flavor/hdf5/parallel
module load netcdf-fortran/4.4.4
module load netcdf-c/4.6.0
module load hdf5/1.8.20
module load nco/4.6.0
module load cdo/1.7.2rc6
module load ncview/2.1.7
module load python3
module load matlab

# WRF/WPS
module load jasper/1.900.1
module load libpng/1.6.23
module load grib/1.26.1
export JASPERLIB=/ccc/products/ccc_users_env/compil/Atos_7__x86_64/jasper-1.900.1/intel--15.0.6.233/default/lib/
export JASPERINC=/ccc/products/ccc_users_env/compil/Atos_7__x86_64/jasper-1.900.1/intel--15.0.6.233/default/include/
export LIBPNGLIB=/ccc/products/ccc_users_env/compil/Atos_7__x86_64/libpng-1.6.23/default/lib/
export LIBPNGINC=/ccc/products/ccc_users_env/compil/Atos_7__x86_64/libpng-1.6.23/default/include/

# OASIS
export NC_INC='-I /ccc/products/netcdf-fortran-4.4.4/intel--17.0.4.196__openmpi--2.0.2/hdf5__parallel/include'
export NC_LIB='-L /ccc/products/netcdf-fortran-4.4.4/intel--17.0.4.196__openmpi--2.0.2/hdf5__parallel/lib -lnetcdff'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
```
