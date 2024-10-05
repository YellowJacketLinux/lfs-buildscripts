#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d file-${file_version} ] && rm -rf file-${file_version}

tar -zxf ${file_tarball}

cd file-${file_version}

mkdir build
pushd build

../configure --disable-bzlib \
  --disable-libseccomp \
  --disable-xzlib      \
  --disable-zlib

make

if [ $? -ne 0 ]; then
  myfail "Failed building file"
fi

popd

./configure --prefix=/usr \
  --host=${LFS_TGT} \
  --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file

if [ $? -ne 0 ]; then
  myfail "Failed building file"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing libstdc++"
fi

rm -f ${LFS}/usr/lib/libmagic.la

