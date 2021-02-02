## Coupling masks and OASIS inputs

Download the tar file [Masks.tar.gz](https://github.com/marcolarranaga/ias12wiki/tree/master/preprocessing/Masks.tar.gz) with the scripts.

Extract the files:
```bash
tar -xvf Masks.tar.gz
```

Go to the cases folder and copy or rename the IAS12 folder to your configuration name.

Include the mesh_mask.nc (NEMO) and geo_em.d01.nc (WRF) files in the infiles folder.

Modify the variables title, infilename and outfilename of the gen_nemo2roms_grid.m according to the new messh_mask file.

Modify the variable filename in the create_roms_corners_function.m according to the new messh_mask file.

Run the gen_nemo2roms_grid.m script to convert the mesh_mask.nc file to the ROMS format, and the create_roms_corners_function.m script to calculate the corners of the grid.

```bash
matlab -nosplash -nodisplay -nodesktop -r "gen_nemo2roms_grid.m; create_roms_corners_function.m; exit;"
```

Run the script_make_file_oasis_IAS12.sh script to compute the OASIS input files:
```bash
./script_make_file_oasis_IAS12.sh
```

The outputs files will be located in the outfiles folder:
```bash
grids.nc
areas.nc
masks.nc
CPLMASK_d01.nc
```

