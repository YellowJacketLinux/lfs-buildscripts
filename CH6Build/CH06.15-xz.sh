#!/bin/bash

source ../versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d xz-${xz_version} ] && rm -rf xz-${xz_version}

tar -Jxf ${xz_tarball}

cd xz-${xz_version}

./configure --prefix=/usr \
  --host=${LFS_TGT} \
  --build=$(build-aux/config.guess) \
  --disable-static \
  --docdir=/usr/share/doc/xz-${xz_version}

make

if [ $? -ne 0 ]; then
  myfail "Failed building xz"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing xz"
fi

rm -v ${LFS}/usr/lib/liblzma.la

popd

# cleanup

pushd ${GLSOURCES}

rm -rf xz-${xz_version}

popd
