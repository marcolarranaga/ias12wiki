#!/bin/ksh

MAXSUB=3 # number of runs
TRDTRA=1
TRDDYN=0
BATHY=1
BAT=1
TEMP=1
SAL=1
ROFF=1
REL=0
BDY=1
BDYTIDE=0
MOOR=0
FBT=0
FLX=0
CHL=1
FLXCORE=1
IA=0
MESH=0
gr=1
bfr=0
geo=0
COEF2D=0
ICE=0
TRACER=0
PISCES=0
IOF=1     # interpolation on the fly 
MLD=0     # mixed layer diags
TRD=0     # temp trends diags
SPECIALWINDS=0
RESCDF=1
TRDVOR=0
CYCLONES=0
OBC_CLIM=0

NOCEAN=276
NNODES=6

CONFIG=IAS12
CASE=ML002
STDIR=/ccc/store/cont005/gen7298/larranam/results/
OUTDIR=$STDIR/$CONFIG/

CONFIG_CASE=${CONFIG}-${CASE}

WORKDIR=/ccc/work/cont005/gen7298/larranam/$CONFIG/
STODIR=/ccc/store/cont005/gen7298/larranam/$CONFIG/

P_CTL_DIR=$WORKDIR/models/nemo/nemo_4.0_uncoupled/cfgs/IAS12-ML00/EXP00/

SCRATCHDIR=/ccc/scratch/cont005/gen7298/larranam/
TDIR=$SCRATCHDIR/$CONFIG/run/nemo/$CONFIG_CASE
F_S_DIR=${OUTDIR}/${CONFIG_CASE}-S
F_R_DIR=${OUTDIR}/${CONFIG_CASE}-R
F_I_DIR=${OUTDIR}/${CONFIG_CASE}-I
F_D_DIR=${OUTDIR}/${CONFIG_CASE}-D
TOOLS_DIR=$WORKDIR/models/nemo/nemo_4.0_uncoupled/tools/
XIOS_DIR=$WORKDIR/models/xios/xios-2.5_withoutOASIS/

F_DTA_DIR=$SCRATCHDIR/$CONFIG/inputs/nemo/
F_BDY_DIR=$SCRATCHDIR/$CONFIG/inputs/nemo/BDY_MERCATOR_2V4_RIM5/
#F_BIO_DIR=$WORKDIR/FORCING/TROPBIO-I/PISCES/
F_FOR_DIR=$SCRATCHDIR/$CONFIG/inputs/nemo/DFS5.2/

## Modified runoff 
#F_RNF_DIR=$WORKDIR/FORCING/TROPBIO-I/river_forcing_orca025_v3/
F_RNF_DIR=$SCRATCHDIR/$CONFIG/inputs/nemo/build_Runoff/
#F_RNF_DIR=$WORKDIR/NOW/input/NEMO/
#
## Cyclones
#F_FOR_DIR_CYCLONES=$WORKDIR/FORCING/DFS5.2_WIND_TC_RMEAN11DAYS/
#TC_TRACKS_DIR=$WORKDIR/FORCING/tc_tracks_1958-2012/


# set specific file names (data )                     ;   and their name in OPA9       
#----------------------------------------------------------------------------------

AGRIF_FIXED_GRID=AGRIF_FixedGrids.in      ; OPA_AGRIF_FIXED_GRID=AGRIF_FixedGrids.in

DOMFILE=IAS12_domain_cfg.nc ; OPA_DOMFILEL=domain_cfg.nc
#BATFILE_LEVEL=NTATL025_bathy.nc ; OPA_BATFILE_LEVEL=bathy_level.nc
#BATFILE_METER=NTATL025_bathy.nc  ; OPA_BATFILE_METER=bathy_meter.nc
#COORDINATES=NTATL025_coordinates.nc       ; OPA_COORDINATES=coordinates.nc
#COORDINATES=NTATL025_coordinates.nc       ; OPA_COORDINATES=coordinates.nc
#TEMPDTA=Levitus_p2.1_1m_Tpot_tatl025.l75.nc ; OPA_TEMPDTA=data_1m_potential_temperature_nomask.nc
#SALDTA=Levitus_p2.1_1m_S_correc_tatl025.l75.nc; OPA_SALDTA=data_1m_salinity_nomask.nc
#SSSDTA=Levitus_p2.1_SSS_golfo12.nc        ; OPA_SSSDTA=sss_data.nc


TEMPDTA=Levitus_p2.1_0_Tpot_IAS12.l75.nc ; OPA_TEMPDTA=data_1m_potential_temperature_nomask.nc
SALDTA=Levitus_p2.1_0_S_correc_IAS12.l75.nc; OPA_SALDTA=data_1m_salinity_nomask.nc
RUNOFF=IAS12_runoff    ; OPA_RUNOFF=runoff_1m_nomask
MOOFILE=IAS12_mask_mooring.nc         ; OPA_MOOFILE=mask_mooring.nc

#CHLORO=NTATL025_chlglobcolour.nc ; OPA_CHLORO=chlorophyll.nc
CHLORO=IAS12_chlglobcolour.nc ; OPA_CHLORO=chlorophyll.nc

#1_BATFILE_LEVEL=1_NTATL025_bathy.nc ; 1_OPA_BATFILE_LEVEL=1_bathy_level.nc
#1_BATFILE_METER=1_NTATL025_bathy.nc  ; 1_OPA_BATFILE_METER=1_bathy_meter.nc
#1_COORDINATES=1_NTATL025_coordinates.nc       ; 1_OPA_COORDINATES=1_coordinates.nc
#1_TEMPDTA=1_Levitus_p2.1_1m_Tpot_tatl025.l75.nc ; 1_OPA_TEMPDTA=1_data_1m_potential_temperature_nomask.nc
#1_SALDTA=1_Levitus_p2.1_1m_S_correc_tatl025.l75.nc; 1_OPA_SALDTA=1_data_1m_salinity_nomask.nc
#1_SSSDTA=1_Levitus_p2.1_SSS_golfo12.nc        ; 1_OPA_SSSDTA=1_sss_data.nc
#1_RUNOFF=1_NTATL025_runoff.nc         ; 1_OPA_RUNOFF=1_runoff_1m_nomask.nc
#
#
#2_BATFILE_LEVEL=2_NTATL025_bathy.nc ; 2_OPA_BATFILE_LEVEL=2_bathy_level.nc
#2_BATFILE_METER=2_NTATL025_bathy.nc  ; 2_OPA_BATFILE_METER=2_bathy_meter.nc
#2_COORDINATES=2_NTATL025_coordinates.nc       ; 2_OPA_COORDINATES=2_coordinates.nc
#2_TEMPDTA=2_Levitus_p2.1_1m_Tpot_tatl025.l75.nc ; 2_OPA_TEMPDTA=2_data_1m_potential_temperature_nomask.nc
#2_SALDTA=2_Levitus_p2.1_1m_S_correc_tatl025.l75.nc; 2_OPA_SALDTA=2_data_1m_salinity_nomask.nc
#2_SSSDTA=2_Levitus_p2.1_SSS_golfo12.nc        ; 2_OPA_SSSDTA=2_sss_data.nc
#2_RUNOFF=2_NTATL025_runoff.nc         ; 2_OPA_RUNOFF=2_runoff_1m_nomask.nc


if [ $IOF = 1 ] ; then
W_BC_ERA=weights_DFS5.2_IAS12_bicub.nc         ; OPA_W_BC_ERA=weights_bicubic.nc
W_BL_ERA=weights_DFS5.2_IAS12_bilin.nc           ; OPA_W_BL_ERA=weights_bilin.nc
#W_BL_SLP_ERA=weights_DFS5.2_era40_slp_ntatl025_bilin.nc ; OPA_W_BL_SLP_ERA=weights_era40_slp_bilin.nc

#1_W_BC_ERA=1_weights_DFS5.2_tatl025_bicub.nc         ; 1_OPA_W_BC_ERA=1_weight_bicubic.nc
#1_W_BL_ERA=1_weights_DFS5.2_tatl025_bilin.nc           ; 1_OPA_W_BL_ERA=1_weight_bilin.nc
#
#2_W_BC_ERA=2_weights_DFS5.2_tatl025_bicub.nc         ; 2_OPA_W_BC_ERA=2_weight_bicubic.nc
#2_W_BL_ERA=2_weights_DFS5.2_tatl025_bilin.nc           ; 2_OPA_W_BL_ERA=2_weight_bilin.nc

PRECIP=drowned_precip_DFS5.2                   ; OPA_PRECIP=precip
SNOW=drowned_snow_DFS5.2                   ; OPA_SNOW=snow
SHORT_WAVE=drowned_radsw_DFS5.2                   ; OPA_SHORT_WAVE=radsw
LONG_WAVE=drowned_radlw_DFS5.2                       ; OPA_LONG_WAVE=radlw
U10=drowned_u10_DFS5.2                        ; OPA_U10=u10
V10=drowned_v10_DFS5.2                             ; OPA_V10=v10
TAUX=sozotaux_NTATL025E18                                       ; OPA_TAUX=sozotaux_1m
TAUY=sometauy_NTATL025E18                                       ; OPA_TAUY=sometauy_1m
HUMIDITY=drowned_q2_DFS5.2                        ; OPA_HUMIDITY=q2
TAIR=drowned_t2_DFS5.2                            ; OPA_TAIR=t2
TCC=drowned_tcc_DFS5.2                            ; OPA_TCC=tcc
SLP=msl_ERAinterim                        ; OPA_SLP=MSL
fi

if [ $BDY = 1 ] ; then
   BDY_COORD=coordinates.bdy_IAS12.nc  ; OPA_BDY_COORD=bdy_coordinates.nc
   BDY_TRA=bdyT_tra_IAS12              ; OPA_BDY_TRA=bdyT_tra 
   BDY_TU2D=bdyT_u2d_IAS12              ; OPA_BDY_TU2D=bdyT_u2d 
   BDY_UU2D=bdyU_u2d_IAS12              ; OPA_BDY_UU2D=bdyU_u2d 
   BDY_VU2D=bdyV_u2d_IAS12              ; OPA_BDY_VU2D=bdyV_u2d 
   BDY_UU3D=bdyU_u3d_IAS12              ; OPA_BDY_UU3D=bdyU_u3d 
   BDY_VU3D=bdyV_u3d_IAS12              ; OPA_BDY_VU3D=bdyV_u3d 
fi

if [ $PISCES = 1 ] ; then
   BIO_ALK=ALK_GLODAPv2-ORCA025-75L_annual_extrap.nc4   ;OPA_BIO_ALK=data_Alkalini_nomask.nc
   BIO_NO3=NO3_WOA2013-ORCA025-75L_monthly_extrap.nc4   ;OPA_BIO_NO3=data_NO3_nomask.nc
   BIO_DIC=DIC_GLODAPv2-ORCA025-75L_annual_extrap.nc4   ;OPA_BIO_DIC=data_DIC_nomask.nc
   BIO_O2=O2_WOA2013-ORCA025-75L_monthly_extrap.nc4     ;OPA_BIO_O2=data_O2_nomask.nc
   BIO_DOC=DOC_ORCA2-ORCA025-75L_monthly_extrap.nc4     ;OPA_BIO_DOC=data_DOC_nomask.nc
   BIO_PO4=PO4_WOA2013-ORCA025-75L_monthly_extrap.nc4   ;OPA_BIO_PO4=data_PO4_nomask.nc
   BIO_SI=Si_WOA2013-ORCA025-75L_monthly_extrap.nc4     ;OPA_BIO_SI=data_Si_nomask.nc
   BIO_FE=Fe_ORCA2-ORCA025-75L_monthly_extrap.nc4       ;OPA_BIO_FE=data_Fer_nomask.nc
   
   BIO_NDEPO=NDEPO_ORCA2-ORCA025_annual_extrap.nc4      ;OPA_BIO_NDEPO=data_ndeposition.nc
#   BIO_RIVER=BIOMERGLORYS2V3_river.orca025.nc           ;OPA_BIO_RIVER=data_river.nc
   BIO_RIVER=BIOMERGLORYS2V3_river.orca025.correctedv1  ;OPA_BIO_RIVER=data_river
   BIO_SOLUB=SOLUB_ORCA2-ORCA025_annual_extrap.nc4      ;OPA_BIO_SOLUB=data_solubility.nc
   BIO_DUST=DUST_ORCA2-ORCA025_monthly_extrap.nc4       ;OPA_BIO_DUST=data_dust.nc

   BIO_BATHY=NTATL025_bathy.iron.nc                      ;OPA_BIO_BATHY=data_bathy.nc
   BIO_PAR=NTATL025_par.nc                               ;OPA_BIO_PAR=data_par.nc

   BDY_TRC=bdyT_trc_NTATL025.nc                          ;OPA_BDY_TRC=bdyT_trc.nc

fi 

#if [ $OBC = 1 ] ; then
#   OBC_NORTH=obc_TROPICAL.L75_north             ; OPA_OBC_NORTH=obc_north
#   OBC_SOUTH=obc_TROPICAL.L75_south             ; OPA_OBC_SOUTH=obc_south
#   OBC_WEST=obc_TROPICAL.L75_west             ; OPA_OBC_WEST=obc_west
#fi
#
#if [ $OBC_CLIM = 1 ] ; then
#   OBC_NORTH=obc_ORCA025-G70_north             ; OPA_OBC_NORTH=obc_north
#   OBC_SOUTH=obc_ORCA025-G70_south             ; OPA_OBC_SOUTH=obc_south
#fi

#----------------------------------------------------------------------#
#       2. Some functions                                              #
#----------------------------------------------------------------------#

# remove old restart files from the working directory
clean_res() { \rm  $P_R_DIR/*.$1.tar.* ; }

rapatrie() { echo ${1:-none} | grep -iv none && { ln -sf  $2/$1 $3  || \
{ echo $1 not found anywhere ; exit ; } ; } ; }

rapatrie_res() { echo ${1:-none} | grep -iv none && { cp -f $2/$1 $3 || \
{ echo $1 not found anywhere ; exit ; } ; } ; }

# expatrie doas a mfput of file $1 on the directory $2, with filename $3
expatrie() { mv -f $1 $2/$3 ; }

# expatrie_res doas a mfput of file $1 on the directory $2, with filename $3; 
#copy $1 on local disk $4
expatrie_res() { eval mv $2/$1 $4/$3 ; }

# check existence and eventually create directory
chkdir() { if [ ! -d $1 ] ; then mkdir -p $1 ; fi ; }

# LookInNamelist returns the value of a variable in the namelist
#         example: aht0=$(LookInNamelist aht0 )
LookInNamelist()    { eval grep -e $1 namelist_cfg | tr -d \' | tr -d \"  | sed -e 's/=/  = /' | awk ' {if ( $1 == str ) print $3 }' str=$1 ; }

# Give the number of file containing $1 in its name
number_of_file() { ls -1 *$1* 2> /dev/null | wc -l  ; }

export rapatrie
export rapatrie_res
export expatrie
export expatrie_res
export chkdir
export LookInNamelist
export number_of_file


