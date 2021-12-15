## Compiling OASIS

Edit paths in make.irene and make.inc files in:

```bash
IAS12/models/oasis3-mct/util/make_dir
```

To remove all OASIS3-MCT compiled sources and libraries:
```bash
make realclean -f TopMakefileOasis3
```

Then:

```bash
make -f TopMakefileOasis3
```

The executable files will appear in:

```bash
IAS12/models/oasis3-mct/bin/lib/
```

