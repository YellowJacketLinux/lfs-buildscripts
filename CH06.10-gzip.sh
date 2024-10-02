#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

tar -Jxf ${gzip_tarball}

cd gzip-${gzip_version}

./configure --prefix=/usr \
  --host=${LFS_TGT} 

make

if [ $? -ne 0 ]; then
  myfail "Failed building gzip"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing gzip"
fi


