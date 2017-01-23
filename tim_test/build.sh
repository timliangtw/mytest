#!/bin/sh


sudo losetup -d /dev/loop4
pftp -v -n 172.22.12.82 <<-EOF
  user "ftpuser" "P@ssw0rd"
  cd "officialbuild/imx6_yocto_bsp_2.1_2.0.0"
  prompt
  binary
  mget fsl-image-qt5-imx6qrsb4411a1-20161020190855.rootfs.sdcard.original
  close
  quit
EOF

dd if=/dev/zero of=fsl-image-qt5-imx6qrsb4411a1-20161020190855.rootfs.sdcard bs=1M count=4200

sudo losetup /dev/loop4 fsl-image-qt5-imx6qrsb4411a1-20161020190855.rootfs.sdcard
sudo dd if=fsl-image-qt5-imx6qrsb4411a1-20161020190855.rootfs.sdcard.original of=/dev/loop4

sudo sync
rootfs_start=`sudo fdisk -u -l /dev/loop4 | grep /dev/loop4p2 | cut -d ' ' -f 12`
sudo fdisk -u /dev/loop4 << EOF &>/dev/null
d
2
n
p
2
$rootfs_start
$PARTITION_SIZE_LIMIT
w
EOF
sudo sync
sudo e2fsck -f -y /dev/loop4p2
sudo resize2fs /dev/loop4p2
sudo losetup -d /dev/loop4
