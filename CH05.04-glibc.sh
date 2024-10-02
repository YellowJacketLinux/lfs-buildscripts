#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

tar -Jxf ${glibc_tarball}
cd glibc-${glibc_version}

case $(uname -m) in
  i?86)   ln -sfv ld-linux.so.2 ${LFS}/lib/ld-lsb.so.3
  ;;
  x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 ${LFS}/lib64
          ln -sfv ../lib/ld-linux-x86-64.so.2 ${LFS}/lib64/ld-lsb-x86-64.so.3
  ;;
esac

patch -Np1 -i ../${glibc_patch_file}

mkdir build
cd build

echo "rootsbindir=/usr/sbin" > configparms

../configure \
  --prefix=/usr \
  --host=${LFS_TGT} \
  --build=$(../scripts/config.guess) \
  --enable-kernel=4.19 \
  --with-headers=${LFS}/usr/include \
  --disable-ncsd \
  libc_cv_slibdir=/usr/lib

make

if [ $? -ne 0 ]; then
  myfail "Failed building glibc"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing glibc"
fi

sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd

echo 'int main(){}' | ${LFS_TGT}-gcc -xc -
readelf -l a.out | grep ld-linux

rm -v a.out
