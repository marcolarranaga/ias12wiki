## Compiling Nemo

Modify XIOS_HOME and OASIS_HOME paths in NTATL008/now/models/nemo/Nemo_4.0_uncoupled/arch/CNRS/arch-X64_IRENE.fcm **<- Not sure if it is needed for the uncoupled case**

From /NTATL025/models/Nemo_4.0_release/cfgs/ copy a configuration folder to generate a new one:

```bash
cp -r NTATL025-ML00 NTATL008-ML00
```

Erase the BLD and WORK folders in NTATL008-ML00

```bash
cd NTATL025AGRIF-I-NOW-ML00
rm -rf BLD WORK
```

Modify the name of cpp file to the to the new configuration folder name

```bash
mv cpp_NTATL025-ML00.fcm cpp_NTATL008-ML00.fcm
```

Check the cpp file to see that it does not contain key_oasis3 and key_agrif:

```bash
bld::tool::fppkeys key_diahth key_iomput key_mpp_mpi key_nosignedzero
```

Go to the NTATL008-ML00/EXP00 and modify the paths in the .ksh fikes:

**AQUI VOY**
---

```bash
/ccc/work/cont005/gen7298/larranam/NTATL025/NOW/input/NEMO/
```

The WRF inputs will be incorporated in:

```bash
/ccc/store/cont005/gen7298/larranam/NTATL025/NOW/input/WRF/
```

The OASIS inputs will be incorporated in:

```bash
/ccc/work/cont005/gen7298/larranam/NTATL025/NOW/input/OASIS/
```

The outputs will be located in:

```bash
/ccc/store/cont005/legos/legos/NOW/NTATL025/<Name experiment>
```

Modify the .db file to include 1 (number of month runnings), 1 (first time step) and the numbers of time steps to complete the fist month (1488 to complete 31 days with a time step of 1800 s.

Example:

1 1 1488

To compile Nemo:

```bash
./makenemo -r ORCA2_ICE_PISCES -n NTATL025-NOW-ML00 -m X64_IRENE -j 4
```

where:

ORCA2_ICE_PISCES —> Configuration name

NTATL025-NOW-ML00 —> Configuration folder

X64_IRENE —> ?
