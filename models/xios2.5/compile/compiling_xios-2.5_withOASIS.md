## Compiling XIOS

Edit the files arch-X64_IRENE.env and arch-X64_IRENE.path that are located in:

```bash
IAS12/models/xios/xios-2.5_withOASIS/arch/
```
The arch-X64_IRENE.env must be in blank.

In the arch-X64_IRENE.path there mus be included the OASIS path.

In the main directory, modify the path inside fcm_env.sh and link the file with fcm_env.ksh through a symbolic link.

To compile execute:

```bash
./make_xios --arch X64_IRENE --use_oasis oasis3_mct >& log.compile.irene
```
Could be also included --full to generate dependencies and recompile from scratch,
and --job 10 to accelerate the compilation:

```bash
./make_xios --full --job 6 --arch X64_IRENE --use_oasis oasis3_mct >& log.compile.irene
```
