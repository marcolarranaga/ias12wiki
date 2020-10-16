## Tools Nemo

To compile nemo tools:

```bash
cd nemo_4.0/tools
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

### Change time step between runs

The .md file will show us which is the next number of simulation (first colum), in which time
step it will start (seccond column) and in which time step the model is going to stop
(third column).

Example:
```bash
64 367873 373632 19980430
65 373633 379584 19980531
66 379585 385344 19980630
67 385345 391296
```

