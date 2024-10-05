#!/bin/bash

source ../versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d patch-${patch_version} ] && rm -rf patch-${patch_version}

tar -Jxf ${patch_tarball}

cd patch-${patch_version}

./configure --prefix=/usr \
  --host=${LFS_TGT} \
  --build=$(build-aux/config.guess)

make

if [ $? -ne 0 ]; then
  myfail "Failed building patch"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing patch"
fi


