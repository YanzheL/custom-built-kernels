#!/bin/bash

SRC_REPO=https://github.com/YanzheL/linux.git
SRC_BRANCH=v5.4.30-bbr2

git clone -v --depth 20 -b $SRC_BRANCH $SRC_REPO
cd linux

export LLVM_SUBFIX="-9"
export CC=clang${LLVM_SUBFIX} \
       LD=ld.lld${LLVM_SUBFIX} \
       AS=llvm-as${LLVM_SUBFIX} \
       AR=llvm-ar${LLVM_SUBFIX} \
       NM=llvm-nm${LLVM_SUBFIX} \
       STRIP=llvm-strip${LLVM_SUBFIX} \
       OBJCOPY=llvm-objcopy${LLVM_SUBFIX} \
       OBJDUMP=llvm-objdump${LLVM_SUBFIX} \
       OBJSIZE=llvm-size${LLVM_SUBFIX} \
       READELF=llvm-readelf${LLVM_SUBFIX} \
       HOSTCC=clang${LLVM_SUBFIX} \
       HOSTLD=ld.lld${LLVM_SUBFIX} \
       HOSTAR=llvm-ar${LLVM_SUBFIX}

# BRANCH=`git rev-parse --abbrev-ref HEAD | sed s/-/+/g`
SHA1=`git rev-parse --short HEAD`
export KERNELVERSION=`make kernelversion`
export LOCALVERSION=+google-bbr+v2alpha+${SHA1}+clang

mako_reactor() {
time \
KBUILD_BUILD_TIMESTAMP=$(date) \
KBUILD_BUILD_USER=driver \
KBUILD_BUILD_HOST=clangbuiltlinux \
make -j$(nproc) \
    CC="${CC}" \
    LD="${LD}" \
    AS="${AS}" \
    AR="${AR}" \
    NM="${NM}" \
    STRIP="${STRIP}" \
    OBJCOPY="${OBJCOPY}" \
    OBJDUMP="${OBJDUMP}" \
    OBJSIZE="${OBJSIZE}" \
    READELF="${READELF}" \
    HOSTCC="${CC}" \
    HOSTLD="${HOSTLD}" \
    KCFLAGS="-Wno-implicit-fallthrough" \
    INSTALL_MOD_STRIP=1 \
    LOCALVERSION=${LOCALVERSION} \
    "${@}"
}

cp /boot/config-5.4.28-050428-generic .config
scripts/config -e CONFIG_TCP_CONG_BBR -e CONFIG_TCP_CONG_BBR2 -e CONFIG_DEFAULT_BBR2 --set-str CONFIG_DEFAULT_TCP_CONG "bbr2" -d CONFIG_DEBUG_INFO
mako_reactor olddefconfig
mako_reactor prepare
mako_reactor deb-pkg
