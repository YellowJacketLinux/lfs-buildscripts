#!/bin/bash

source ../versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d binutils-${binutils_version} ] && rm -rf binutils-${binutils_version}

tar -Jxf ${binutils_tarball}

cd binutils-${binutils_version}

sed '6009s/$add_dir//' -i ltmain.sh

mkdir build && cd build

../configure --prefix=/usr \
  --build=$(../config.guess) \
  --host=${LFS_TGT} \
  --disable-nls \
  --enable-shared \
  --enable-gprofng=no \
  --disable-werror \
  --enable-64-bit-bfd \
  --enable-new-dtags \
  --enable-default-hash-style=gnu

make

if [ $? -ne 0 ]; then
  myfail "Failed building binutils"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing binutils"
fi

rm ${LFS}/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}

popd

# cleanup

pushd ${GLSOURCES}

rm -rf binutils-${binutils_version}

popd
