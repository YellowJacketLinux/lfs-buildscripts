#!/bin/bash

# FIXME - doesn't build d or ada compiler

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gcc-${gcc_version} ] && rm -rf gcc-${gcc_version}

tar -Jxf ${gcc_tarball}

cd gcc-${gcc_version}

tar -xf ../${mpfr_tarball}
mv mpfr-${mpfr_version} mpfr
tar -xf ../${gmp_tarball}
mv gmp-${gmp_version} gmp
tar -xf ../${mpc_tarball}
mv mpc-${mpc_version} mpc

sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

mkdir build && cd build

../configure \
  --build=$(../config.guess) \
  --host=${LFS_TGT} \
  --target=${LFS_TGT} \
  LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc \
  --prefix=/usr \
  --with-build-sysroot=${LFS} \
  --enable-default-pie \
  --enable-default-ssp \
  --disable-nls \
  --disable-multilib \
  --disable-libatomic \
  --disable-libgomp \
  --disable-libquadmath \
  --disable-libsanitizer \
  --disable-libssp \
  --disable-libvtv \
  --enable-languages=c,c++


make

if [ $? -ne 0 ]; then
  myfail "Failed building gcc pass2"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing gcc pass2"
fi

ln -sv gcc $LFS/usr/bin/cc
