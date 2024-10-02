#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gcc-${gcc_version} ] && rm -rf gcc-${gcc_version}

tar -Jxf ${gcc_tarball}

cd gcc-${gcc_version}

mkdir build && cd build

../libstdc++-v3/configure \
  --host=${LFS_TGT} \
  --build=$(../config.guess) \
  --prefix=/usr \
  --disable-multilib \
  --disable-nls \
  --disable-libstdcxx-pch \
  --with-gxx-include-dir=/tools/${LFS_TGT}/include/c++/${gcc_version}

make

if [ $? -ne 0 ]; then
  myfail "Failed building libstdc++"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing libstdc++"
fi


