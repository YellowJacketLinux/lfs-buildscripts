#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

tar -Jxf ${gawk_tarball}

cd gawk-${gawk_version}

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr \
  --host=${LFS_TGT} \
  --build=$(build-aux/config.guess)

make

if [ $? -ne 0 ]; then
  myfail "Failed building gawk"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing gawk"
fi


