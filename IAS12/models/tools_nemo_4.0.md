## Tools Nemo

To compile nemo tools:

```bash
cd tools
./maketools -m X64_IRENE -n REBUILD_NEMO
```

... it also enable nemo to generate restart files.

---
### Generate a mesk_mask.nc file
- To generate the mesh_mask.nc file activate the ln_meshmask in the namelist_cfg:
```bash
ln_meshmask = .true.   !   =T create a mesh file
```
- In the Massively Parallel Processing section of the namelist_cfg file, change the processors number for the rows and colums as in the example:
```bash
jpni        =   6      !  jpni   number of processors following i (set automatically if < 1)
jpnj        =   23     !  jpnj   number of processors following j (set automatically if < 1)
```

In this example where used 138 processors (<img src="https://render.githubusercontent.com/render/math?math=6 \times 23=138">)

- Run nemo for a few time steps.
- Go to the rebuild_nemo directory
```bash
cd nemo_4.0/tools/REBUILD_NEMO/
```
- Run rebuild_nemo:
```bash
./rebuild_nemo <path mesh_mask files>/mesh_mask  <number of procesors used to run nemo>
```
