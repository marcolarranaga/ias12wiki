## Compiling Nemo - coupled case

Modify XIOS_HOME and OASIS_HOME paths in Nemo_4.0_coupled/arch/CNRS/arch-X64_IRENE_fullOASISXIOS.fcm


Generate a new configuration folder:

```bash
cd /IAS12/models/Nemo_4.0_release/cfgs/
cp -r NTATL025-NOW-ML00 IAS12-NOW-ML00
```

Erase the BLD and WORK folders in IAS12-NOW-ML00

```bash
cd IAS12-NOW-ML00
rm -rf BLD WORK
```

Modify the name of cpp file to the to the new configuration folder name

```bash
mv cpp_NTATL025-ML00.fcm cpp_IAS12-NOW-ML00.fcm
```

Check the cpp file to see that it does not contain the key_agrif, the file just need to contain:

```bash
bld::tool::fppkeys key_diahth key_iomput key_mpp_mpi key_nosignedzero key_oasis3
```

To compile Nemo return to the folder Nemo_4.0_coupled and run makenemo:

```bash
cd ..
./makenemo -r ORCA2_ICE_PISCES -n IAS12-NOW-ML00 -m X64_IRENE_fullOASISXIOS -j 4 > log_build_nemo.txt
```

Where:

ORCA2_ICE_PISCES &rarr; Configuration name

IAS12-NOW-ML00 &rarr; Configuration folder

X64_IRENE_fullOASISXIOS &rarr; IRENE configuration

