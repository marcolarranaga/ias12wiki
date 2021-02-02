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

This example have a 450 seconds time step, therefore, the simulation will start at day 2007 and ends at day 2038:

<img src="https://render.githubusercontent.com/render/math?math=(385345-1)/(60*60/450*24)=2007">

<img src="https://render.githubusercontent.com/render/math?math=391296/(60*60/450*24)=2038">

Now that we have the initial and final dumber of days, we have to calculate the corresponding time
step numbers with the new time step, for this case 400 seconds:

<img src="https://render.githubusercontent.com/render/math?math=2007*(60*60/400*24)=433512">

<img src="https://render.githubusercontent.com/render/math?math=2038*(60*60/400*24)=440208">

Now we have te change the numbers in the .md file:

```bash
64 367873 373632 19980430
65 373633 379584 19980531
66 379585 385344 19980630
67 433512 440208
```

To do this quickly we can use the following script (it must be executed in the case folder):

```bash
# Inputs:
conf=IAS12-NOW
expcase=ML02

dtold=450
dtnew=400

restartfilepath=/ccc/store/cont005/gen7298/larranam/IAS12/results/now/${confcase}-R/
#---

confcase=${conf}-${expcase}

dbfile=${expcase}.db

nrun=$( tail -1 ${dbfile} | awk '{print $1}' );

tstpiold=$( tail -1 ${dbfile} | awk '{print $2}' );
tstpfold=$( tail -1 ${dbfile} | awk '{print $3}' );

tstpioldm1=$(( tstpiold - 1 ))

restartfile=`ls ${restartfilepath}/${confcase}*${tstpioldm1}_restart.nc`

ndayinew=$(( tstpioldm1/(60*60/dtold*24) ))
ndayfnew=$(( tstpfold/(60*60/dtold*24) ))

tstpinew=$(( ndayinew*(60*60/400*24) ))
tstpfnew=$(( ndayfnew*(60*60/400*24) ))

# Modifying .db file
\cp $dbfile ${dbfile}.bckp
sed -i '$ d' ${dbfile}
echo "${nrun} ${tstpinew} ${tstpfnew}" >> ${dbfile}
#---

\cp ${restartfile} ${restartfile}.bckp

ncks -C -O -x -v kt,time_counter,rdt ${restartfile} ${restartfile}
ncap2 -O -s kt=${tstpinew} ${restartfile} ${restartfile}
ncap2 -O -s time_counter[time_counter]=${tstpinew} ${restartfile} ${restartfile}
ncap2 -O -s ntime=${dtnew} ${restartfile} ${restartfile}

tmpname=$(basename $restartfile)
tmpname=${tmpname#"${confcase}_"}
tmpname=${tmpname%"_restart.nc"}

nchar=$(echo -n "$tmpname" | wc -c)

printf -v tmpname "%0${nchar}d" ${tstpinew};

restartfilenew=${restartfilepath}/${confcase}_${tmpname}_restart.nc

mv -f $restartfile $restartfilenew


	

```
It is then necessary to modify the variables kt, time_counter and rdt of the restart file:

```bash
kt = 385345 - 1
time_counter = 385345 - 1
rdt = 400

The next step consists of check if the ratio between a day in secconds and the time step is multiple of the nn_trd variable in the namelist_cfg, if it is not, change the variable to the ratio value.


