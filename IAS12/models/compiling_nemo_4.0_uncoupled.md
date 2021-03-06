## Compiling Nemo - uncoupled case

Modify XIOS_HOME paths in Nemo_4.0_uncoupled/arch/CNRS/arch-X64_IRENE.fcm

From /IAS12/models/Nemo_4.0_release/cfgs/ copy a configuration folder to generate a new one:

```bash
cp -r NTATL025-ML00 IAS12-ML00
```

Erase the BLD and WORK folders in IAS12-ML00

```bash
cd IAS12-ML00
rm -rf BLD WORK
```

Modify the name of cpp file to the to the new configuration folder name

```bash
mv cpp_NTATL025-ML00.fcm cpp_IAS12-ML00.fcm
```

Check the cpp file to see that it does not contain key_oasis3 and key_agrif:

```bash
bld::tool::fppkeys key_diahth key_iomput key_mpp_mpi key_nosignedzero
```

To compile Nemo return to the folder Nemo_4.0_coupled and run makenemo:

```bash
cd ..
./makenemo -r ORCA2_ICE_PISCES -n IAS12-ML00 -m X64_IRENE -j 4
```

Where:

ORCA2_ICE_PISCES &rarr; Configuration name

IAS12-NOW-ML00 &rarr; Configuration folder

X64_IRENE &rarr; IRENE configuration

