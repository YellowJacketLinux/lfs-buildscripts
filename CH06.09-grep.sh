#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d grep-${grep_version} ] && rm -rf grep-${grep_version}

tar -Jxf ${grep_tarball}

cd grep-${grep_version}

./configure --prefix=/usr \
  --host=${LFS_TGT} \
  --build=$(build-aux/config.guess)

make

if [ $? -ne 0 ]; then
  myfail "Failed building grep"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing grep"
fi


