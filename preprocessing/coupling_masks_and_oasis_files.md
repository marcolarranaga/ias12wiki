## Coupling masks and OASIS weights for intepolations

Download the tar file [Masks.tar.gz](https://github.com/marcolarranaga/ias12wiki/tree/master/preprocessing/Masks.tar.gz) with the scripts.

Extract the files:
```bash
tar -xvf Masks.tar.gz
```

Go to the cases folder and copy or rename the IAS12 folder to your configuration name.

Include the mesh_mask.nc (NEMO) and geo_em.d01.nc (WRF) files in the infiles folder.

Run the gen_nemo2roms_grid.m to convert the mesh_mask.nc file to the ROMS format.

Run the create_roms_corners_function.m to calculate the corners of the grid.
```bash
matlab -nosplash -nodisplay -nodesktop -r "gen_nemo2roms_grid.m; create_roms_corners_function.m; exit;"

Run the 
