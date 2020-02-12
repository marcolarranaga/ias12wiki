## Compiling WRF 4.1.3 for uncoupled case

Download WRF model from the UCAR site [wrf4.1.3_xios](https://github.com/massonseb/WRF).

To compile WRF:

Copy the WRF files in the work directory:

```bash
/ccc/work/cont005/gen7298/larranam/IAS12/models/wrf/
```

To generate the configure.wrf file export the netCDF path:

```bash
export NETCDF=/ccc/products/netcdf-fortran-4.4.4/intel--17.0.4.196__openmpi--2.0.2/hdf5__parallel/
```

Then run the configure file:

```bash
./configure
```
To compile run:

```bash
cd NOW/models/wrf3.7.1_coupled
mv configure.wrf configure.wrf.save
./clean -a
./clean a
mv configure.wrf.save configure.wrf
./compile -j 16 em_real >out1.log 2>out2.log
```

