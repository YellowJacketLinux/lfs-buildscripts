#!/bin/bash

source ../versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d binutils-${binutils_version} ] && rm -rf binutils-${binutils_version}

tar -Jxf ${binutils_tarball}
cd binutils-${binutils_version}

mkdir build
cd build

../configure --prefix=${LFS}/tools \
  --with-sysroot=${LFS} \
  --target=${LFS_TGT} \
  --disable-nls \
  --enable-gprofng=no \
  --disable-werror    \
  --enable-new-dtags  \
  --enable-default-hash-style=gnu

make

if [ $? -ne 0 ]; then
  myfail "Failed building binutils pass 1"
fi

make install

if [ $? -ne 0 ]; then
  myfail "Failed installing binutils pass 1"
fi
