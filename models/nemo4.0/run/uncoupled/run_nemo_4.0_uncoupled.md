## Run nemo_4.0_uncoupled

Go to the nemo_4.0_uncoupled/cfgs/<config_case>/EXP00 and modify the paths in the .ksh fikes:

The nemo inputs will be in:
```bash
/ccc/scratch/cont005/gen7298/larranam/IAS12/inputs/nemo/
```

The outputs will be located in:

```bash
/ccc/store/cont005/gen7298/larranam/results/IAS12/<config_case>/
```

Create a .db file with the corresponding configuration name, in this case: IAS12-ML001.db

The the .db file must include the following information:

```bash
1 1 52562
```

where:

- 1     &larr; number of month runnings
- 1     &larr; first time step
- 52562 &larr; numbers of time steps to complete the fist month (52562 to complete 365 days with a time step of 60 s).

Finaly:
```bash
ccc_msub run_nemo
```
