## Compiling WPS

Download WPS from the [UCAR site](https://www2.mmm.ucar.edu/wrf/users/download/get_source.html)
To compile WPS:

Copy the WPS files in the work directory:

```bash
/ccc/work/cont005/gen7298/larranam/IAS12/models/WRF/
```

Add the [configure.wps](configure.wps) file in to the wps.4.1.3 folder and modify the WRF_DIR path.

To compile WPS run:

```bash
mv configure.wps configure.wps.save
./clean -a
./clean a
mv configure.wps.save configure.wps
./compile >& compile.log
```

