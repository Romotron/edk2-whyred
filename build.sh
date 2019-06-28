#!/bin/bash
device=XiaomiRedmiNote5Pkg
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p $device/$device.dsc
gzip -9nkc < workspace/Build/$device/DEBUG_GCC5/FV/XIAOMIREDMINOTE5_UEFI.fd >uefi.img
cat uefi.img whyred.dtb > edk2_whyred.img
