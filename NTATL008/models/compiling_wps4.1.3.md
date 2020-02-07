## Compiling WPS

Download WPS from the [UCAR site](https://www2.mmm.ucar.edu/wrf/users/download/get_source.html)
To compile WPS:

Copy the WPS files in the work directory:

```bash
/ccc/work/cont005/gen7298/larranam/NTATL008/NOW/models/WRF/
```

Add the configure.wps file in to the wps.4.1.3 folder and modify the WRF_DIR path.

To compile WPS run:

```bash
cp configure.wps configure.wps.save
./clean -a
./clean a
cp configure.wps.save configure.wps
./compile >& compile.log
```

