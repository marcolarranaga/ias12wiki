## Run nemo_4.0_uncoupled

Go to the NTATL008-ML00/EXP00 and modify the paths in the .ksh fikes:

The nemo inputs will be in:
```bash
/ccc/work/cont005/gen7298/larranam/NTATL008/NOW/inputs/nemo/
```

The outputs will be located in:

```bash
/ccc/store/cont005/legos/legos/NOW/NTATL025/<Name experiment>
```

Create a symbolic link for the atmospheric forcings:
```bash
ln -s /ccc/store/cont005/legos/legos/FORCING/DFS5.2 /ccc/work/cont005/gen7298/larranam/NTATL008/NOW/inputs/nemo/
```

Create a .db file with the corresponding configuration name, in this case: IAS12-ML001.db

The the .db file must include the following information:

```bash
1 1 17520
```

where:

- 1 &larr; number of month runnings
- 1 &larr; first time step
- 17520 &larr; numbers of time steps to complete the fist month (17520 to complete 365 days with a time step of 180 s).

---

ccc_msub run_nemo
