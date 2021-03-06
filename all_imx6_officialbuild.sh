#!/bin/bash
echo "[ADV] DATE = ${DATE}"
echo "[ADV] STORED = ${STORED}"
echo "[ADV] VERSION = ${VERSION}"
echo "[ADV] BUILD_NUMBER = ${BUILD_NUMBER}"
echo "[ADV] REALEASE_NOTE = $Release_Note"

echo "[ADV] FTP_DIR = $FTP_DIR"
echo "[ADV] DOWNLOADS = $DOWNLOADS"

echo "[ADV] BSP_URL = $BSP_URL"
echo "[ADV] BSP_BRANCH = $BSP_BRANCH"

echo "[ADV] U_BOOT_VERSION = $U_BOOT_VERSION"
echo "[ADV] U_BOOT_URL = $U_BOOT_URL"
echo "[ADV] U_BOOT_BRANCH = $U_BOOT_BRANCH"
echo "[ADV] U_BOOT_PATH = $U_BOOT_PATH"

echo "[ADV] KERNEL_VERSION = $KERNEL_VERSION"
echo "[ADV] KERNEL_URL = $KERNEL_URL"
echo "[ADV] KERNEL_BRANCH = $KERNEL_BRANCH"
echo "[ADV] KERNEL_PATH = $KERNEL_PATH"

echo "[ADV] META_ADVANTECH_URL = $META_ADVANTECH_URL"
echo "[ADV] META_ADVANTECH_PATH = $META_ADVANTECH_PATH"
echo "[ADV] META_ADVANTECH_BRANCH = $META_ADVANTECH_BRANCH"

echo "[ADV] DEPLOY_IMAGE_NAME = $DEPLOY_IMAGE_NAME"

echo "[ADV] MFGTOOLS_URL = $MFGTOOLS_URL"
echo "[ADV] MFGTOOLS_BRANCH = $MFGTOOLS_BRANCH"

NUM1=`expr $VERSION : 'V\([0-9]*\)'`
NUM2=`expr $VERSION : '.*[.]\([0-9]*\)'`
VERSION_NUM=$NUM1$NUM2
echo "[ADV] VERSION_NUM = $VERSION_NUM"
#[x11]
#imx6_BSP
#imx6_projects
STORAGE_PATH=${STORED}
DATE_PATH=${DATE}
mkdir -p $STORAGE_PATH/$DATE_PATH
touch $STORAGE_PATH/$DATE_PATH/test_file
if [ $UBC220A1_SOLO == true ]; then
	echo 1
fi
if [ $UBCDS31A1 == true ]; then
	echo 2
fi
if [ $ROM5420A1 == true ]; then
	echo 3
fi
if [ $ROM5420B1_SOLO == true ]; then
	echo 4
fi
if [ $ROM5420B1 == true ]; then
	echo 5
fi
if [ $RSB4410A1 == true ]; then
	echo 6
fi
if [ $RSB4410A2 == true ]; then
	echo 7
fi
if [ $RSB4411A1 == true ]; then
	echo 8
fi
if [ $ROM7420A1 == true ]; then
	echo 9
fi
if [ $ROM3420A1 == true ]; then
	echo A
fi
if [ $ROM7421A1_PLUS == true ]; then
	echo B
fi
if [ $ROM7421A1_SOLO == true ]; then
	echo C
fi

#rm *.log
#rm -rf imx6LBV"$VERSION_NUM"*
