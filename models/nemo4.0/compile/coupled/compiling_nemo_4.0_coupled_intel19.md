## Compiling Nemo - coupled case

Modify XIOS_HOME and OASIS_HOME paths in Nemo_4.0_coupled/arch/CNRS/arch-X64_IRENE_fullOASISXIOS.fcm


Generate a new configuration folder:

```bash
cd /IAS12/models/Nemo_4.0_release/cfgs/
cp -r NTATL025-NOW-ML00 IAS12-NOW
```

Erase the BLD and WORK folders in IAS12-NOW

```bash
cd IAS12-NOW
rm -rf BLD
```

Modify the name of cpp file to the to the new configuration folder name

```bash
mv cpp_NTATL025-ML00.fcm cpp_IAS12-NOW.fcm
```

The cpp file must contain:

```bash
bld::tool::fppkeys   key_diainstant key_xios key_oasis3
```

Before compiling the model remove the nemo symbolic link in cfgs/IAS12-NOW/EXP00/nemo

To compile Nemo return to the folder Nemo_4.0_coupled and run makenemo:

```bash
cd ..
./makenemo -r ORCA2_ICE_PISCES -n IAS12-NOW -m X64_IRENE -j 8 > log_build_nemo.txt
```

Where:

ORCA2_ICE_PISCES &rarr; Configuration name

IAS12-NOW-ML00 &rarr; Configuration folder

X64_IRENE_fullOASISXIOS &rarr; IRENE configuration

After compiling nemo, create the nemo.exe symbolic link in the cfgs/IAS12-NOW/EXP00/
```bash
ln -s nemo nemo.exe
```
