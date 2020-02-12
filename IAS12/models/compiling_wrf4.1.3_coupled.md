## Compiling WRF 4.1.3_xios for coupled case

Download WRF 4.1.3 model from the site [wrf4.1.3_xios](https://github.com/massonseb/WRF)

Copy the WRF files in the work directory:

```bash
/ccc/work/cont005/gen7298/larranam/IAS12/models/WRF/wrf4.1.3_xios_coupled/
```

Copy the [configure wrf](configure.wrf.md) file to the wrf4.1.3_xios_coupled folder

To compile run:

```bash
cd NOW/models/wrf3.7.1_coupled
mv configure.wrf configure.wrf.save
./clean -a
./clean a
mv configure.wrf.save configure.wrf
./compile -j 16 em_real >out1.log 2>out2.log
```

