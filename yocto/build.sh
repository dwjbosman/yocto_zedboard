#!/bin/bash

set -ex

CUR_DIR=$(pwd)
OUTPUT_DIR=../yocto_build_env
mkdir $OUTPUT_DIR
cd $OUTPUT_DIR
OUTPUT_DIR=$(pwd)

git clone git://git.yoctoproject.org/poky

cd $OUTPUT_DIR/poky

git checkout sumo
git clone -b sumo https://github.com/Xilinx/meta-xilinx.git
cp -R $CUR_DIR/meta-dts .

source oe-init-build-env


bitbake-layers add-layer "$OUTPUT_DIR/poky/meta-xilinx/meta-xilinx-bsp"
echo "MACHINE ??= \"zedboard-zynq7\"" >> $OUTPUT_DIR/poky/build/conf/local.conf
bitbake core-image-minimal
bitbake-layers add-layer "$OUTPUT_DIR/poky/meta-dts"
#need to remove repodata dir, otherwise we'll get a mv error (the target dir is not empty...)
rm -rf $OUTPUT_DIR/poky/build/tmp/work/zedboard_zynq7-poky-linux-gnueabi/core-image-minimal/1.0-r0/oe-rootfs-repo/repodata
bitbake core-image-minimal -c populate_sdk
 
