### Compiling ww3 6.07.1

Include exports:

```bash
export WWATCH3_NETCDF=NC4
export NETCDF_CONFIG=/ccc/products/python3-3.6.4/intel--17.0.4.196__openmpi--2.0.2/default/bin/nc-config
export OASISDIR=/ccc/work/cont005/gen7298/larranam/IAS12/models/oasis/oasis3-mct_intel19/bin/
```

To clean use:
```bash
./w3_clean -c
```

Use the propper switch file to compile ww3 coupled with the ocean and the atmosphere, it must contain OASIS OASOCM OASACM.

```bash
./w3_setup .. -c Intel -s OASOCM_OASACM
```
