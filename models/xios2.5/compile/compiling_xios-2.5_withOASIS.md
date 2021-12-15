## Compiling XIOS

Edit the files arch-X64_IRENE.env and arch-X64_IRENE.path that are located in:

```bash
IAS12/models/xios/xios-2.5_withOASIS/arch/
```
The arch-X64_IRENE.env must be in blank.

In the arch-X64_IRENE.path there mus be included the OASIS path.

To compile execute:

```bash
./make_xios --arch X64_IRENE --use_oasis oasis3_mct >& log.compile.irene
```
Could be also included --full to generate dependencies and recompile from scratch,
and --job 10 to accelerate the compilation:

```bash
./make_xios --full --job 10 --arch X64_IRENE --use_oasis oasis3_mct >& log.compile.irene
```
