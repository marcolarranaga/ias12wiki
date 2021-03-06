## Compiling WRF 4.1.3 for uncoupled case

Download WRF model from the UCAR site [wrf4.1.3](https://github.com/massonseb/WRF).

To compile WRF:

Copy the WRF files in the work directory:

```bash
/ccc/work/cont005/gen7298/larranam/IAS12/models/wrf/
```

Add the [configure.wrf](https://github.com/marcolarranaga/ias12wiki/tree/master/models/wrf4.1.3/compile/uncoupled/configure.wrf) file in to the wrf.4.1.3 folder.

To compile run:

```bash
cd NOW/models/wrf3.7.1_coupled
mv configure.wrf configure.wrf.save
./clean -a
./clean a
mv configure.wrf.save configure.wrf
./compile -j 16 em_real >out1.log 2>out2.log
```

