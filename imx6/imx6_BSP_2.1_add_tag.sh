CURR_PATH="$PWD"
echo "[ADV] $PWD"

VERSION=$1

U_BOOT_URL="https://github.com/timliangtw/uboot-imx6.git"
U_BOOT_BRANCH="imx_v2016.03_4.1.15_2.0.0_ga"

KERNEL_URL="https://github.com/timliangtw/linux-imx.git"
KERNEL_BRANCH="imx_4.1.15_2.0.0_ga"

META_ADVANTECH_URL="https://github.com/timliangtw/meta-advantech.git"
META_ADVANTECH_BRANCH="krogoth"

function add_tag()
{
	RES=$1
	BRANCH=$2
	DIR=`expr $RES : '.*/\(.*\).git$'`
	VERSION_CHECK=`git ls-remote --tags $RES | grep $VERSION`
	if [ "$VERSION_CHECK" == "" ]; then
		echo "[ADV] git clone $RES"
		git clone $RES
		cd $DIR
		git checkout $BRANCH
		git tag -a $VERSION -m "official build"
		git push origin $VERSION
		cd $CURR_PATH
		echo "[ADV] Remove $DIR"
		rm -rf $DIR
	else
		echo "[ADV] $DIR TAG $VERSION has been tagged"
	fi
}

add_tag $U_BOOT_URL $U_BOOT_BRANCH
add_tag $KERNEL_URL $KERNEL_BRANCH
add_tag $META_ADVANTECH_URL $META_ADVANTECH_BRANCH
