#!/bin/bash

# does not build d,ada compilers

source ../versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gcc-${gcc_version} ] && rm -rf gcc-${gcc_version}

tar -Jxf ${gcc_tarball}
cd gcc-${gcc_version}

tar -xf ../${mpfr_tarball}
mv mpfr-${mpfr_version} mpfr
tar -xf ../${gmp_tarball}
mv gmp-${gmp_version} gmp
tar -xf ../${mpc_tarball}
mv mpc-${mpc_version} mpc

sed -e '/m64=/s/lib64/lib/' \
    -i.orig gcc/config/i386/t-linux64

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

cd ..

cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $(${LFS_TGT}-gcc -print-libgcc-file-name)`/include/limits.h

popd

# cleanup

pushd ${GLSOURCES}

rm -rf gcc-${gcc_version}

popd
