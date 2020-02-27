## Run nemo_4.0_uncoupled

Go to the nemo_4.0_uncoupled/cfgs/<config_case>/EXP00 and modify includefile.ksh file:

- A description of the parameters to modify can be found [here](Parameters_to_modify_includefile.ksh.md).
- An example of the includefile.ksh file can be found [here](https://github.com/marcolarranaga/ias12wiki/tree/master/models/nemo4.0/run/uncoupled/includefile.ksh).

Create a .db file with the corresponding configuration name, in this case: IAS12-ML001.db

The the .db file must include the following information:

```bash
1 1 52562
```

where:

- 1     &larr; number of month runnings
- 1     &larr; first time step
- 52562 &larr; numbers of time steps to complete the fist month (52562 to complete 365 days with a time step of 60 s).

Find the corresponding restart file and move it to the restart folder, then modify the file in order to set the time variables to 0:
```bash
ncks -C -O -x -v kt,ntime,adatrj,time_counter NTATL025-M03_00525600_restart.nc NTATL025-NOW-M00_00000000_restart.nc
ncap2 -O -s kt=0 NTATL025-NOW-M00_00000000_restart.nc NTATL025-NOW-M00_00000000_restart.nc
ncap2 -O -s adatrj=0 NTATL025-NOW-M00_00000000_restart.nc NTATL025-NOW-M00_00000000_restart.nc
ncap2 -O -s ntime=0 NTATL025-NOW-M00_00000000_restart.nc NTATL025-NOW-M00_00000000_restart.nc
ncap2 -O -s time_counter[$time_counter]=0 NTATL025-NOW-M00_00000000_restart.nc NTATL025-NOW-M00_00000000_restart.nc
```
Finaly:
```bash
ccc_msub run_nemo
```
