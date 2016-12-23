#!/bin/bash
# ./all_imx6_officialbuild_yocto_2.0.0.sh [release version] ex. ./all_imx6_officialbuild_yocto_2.0.0.sh V8.010

OFFICIAL_STORAGE="/media/share/RISC_SW/officialbuild/imx6_yocto_bsp_2.1_2.0.0"
SCRIPT_PATH="/build1/dailybuild/scripts_yocto_BSP_2.1_2.0.0"

DATE=`date +%F`

#VER="V8.010"
VER=$1
NUM1=`expr $VER : 'V\([0-9]*\)'`
NUM2=`expr $VER : '.*[.]\([0-9]*\)'`
VERSION_NUM=$NUM1$NUM2

cd $SCRIPT_PATH

#[x11]
#imx6_BSP
./imx6_dailybuild_yocto_2.0.0.sh imx6 imx6LBV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee imx6LBV"$VERSION_NUM"_$DATE.log
#imx6_projects
./imx6_dailybuild_yocto_2.0.0.sh ubc220a1-solo U220A1LIV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee U220A1LIV"$VERSION_NUM"_DualLiteSolo_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh ubcds31a1 DS31A1LIV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee DS31A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rom5420a1 5420A1LIV"$VERSION_NUM" 1G-2G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 5420A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rom5420b1-solo 5420B1LIV"$VERSION_NUM" 512M $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 5420B1LIV"$VERSION_NUM"_DualLiteSolo_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rom5420b1 5420B1LIV"$VERSION_NUM" 1G-2G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 5420B1LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rsb4410a1 4410A1LIV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 4410A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rsb4410a2 4410A2LIV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 4410A2LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rsb4411a1 4411A1LIV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 4411A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rom7420a1 7420A1LIV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 7420A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rom3420a1 3420A1LIV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 3420A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rom7421a1-plus 7421A1LIV"$VERSION_NUM" 1G-2G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 7421A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
./imx6_dailybuild_yocto_2.0.0.sh rom7421a1-solo 7421A1LIV"$VERSION_NUM" 1G $DATE $OFFICIAL_STORAGE x11 $VERSION_NUM 2>&1 |tee 7421A1LIV"$VERSION_NUM"_DualLiteSolo_$DATE.log

cp *.log $OFFICIAL_STORAGE/$DATE/
rm *.log
rm -rf imx6LBV"$VERSION_NUM"*
