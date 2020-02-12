## Compiling XIOS
# FALTA REVISAR arch-X64_IRENE.env.orig

Edit in the arch-X64_IRENE file (there are .env .path and .fcm, noth sure which one) located in:

```bash
IAS12/models/xios-2.5/arch/
```

To compile execute:

```bash
./make_xios --arch X64_IRENE --use_oasis oasis3_mct >& log.compile.irene

