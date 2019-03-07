#!/bin/sh

echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="frameworks/av frameworks/base frameworks/native frameworks/opt/telephony system/core system/netd system/sepolicy packages/apps/FMRadio/jni/fmr"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
        echo "\n${RED}Applying ${NC}$dir ${RED}patches...${NC}\n"
	git apply -v $rootdirectory/device/sony/tuba/patches/$dir/*.patch
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
