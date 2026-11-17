#!/bin/bash
# OrangeFox build for Xiaomi gale (Redmi 13C / Poco C65)
set -o pipefail

export JAVA_HOME="$HOME/jdk11/jdk-11.0.33+10"
export PATH="$JAVA_HOME/bin:$PATH"
export ALLOW_MISSING_DEPENDENCIES=true

cd "$(dirname "$0")/fox_12.1"

export FOX_BUILD_TYPE=Unofficial
export FOX_AB_DEVICE=1
export FOX_VENDOR_BOOT_RECOVERY=1
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_MAINTAINER="chizuui"

# envsetup ends with a non-zero status on this fork; do not let set -e abort for it
source build/envsetup.sh || true
lunch twrp_gale-eng || { echo "lunch failed"; exit 1; }
mka vendorbootimage
