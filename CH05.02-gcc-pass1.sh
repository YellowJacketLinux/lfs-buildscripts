#!/bin/bash

# FIXME - go and objc

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

tar -Jxf ${gcc_tarball}
cd gcc-${gcc_version}

tar -xf ../${mpfr_tarball}
mv mpfr-${mpfr_version} mpfr
tar -xf ../${gmp_tarball}
mv gmp-${gmp_version} gmp
tar -xf ../${mpc_tarball}
mv mpc-${mpc_version} mpc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir build
cd build

../configure \
  --target=${LFS_TGT} \
  --prefix=${LFS}/tools \
  --with-glibc-version=2.40 \
  --with-sysroot=${LFS} \
  --with-newlib \
  --without-headers \
  --enable-default-pie \
  --enable-default-ssp \
  --disable-nls \
  --disable-shared \
  --disable-multilib \
  --disable-threads \
  --disable-libatomic \
  --disable-libgomp \
  --disable-libquadmath \
  --disable-libssp \
  --disable-libvtv \
  --disable-libstdcxx \
  --enable-languages=c,c++


make

if [ $? -ne 0 ]; then
  myfail "Failed building gcc pass 1"
fi

make install

if [ $? -ne 0 ]; then
  myfail "Failed installing gcc pass 1"
fi
