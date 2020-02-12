## Compiling XIOS

Edit in the arch-X64_IRENE.env by let it in blank (there are .env .path and .fcm, noth sure which one) located in:

```bash
IAS12/models/xios-2.5_withoutOASIS/arch/
```

To compile execute:

```bash
./make_xios --arch X64_IRENE  >& log.compile.irene

