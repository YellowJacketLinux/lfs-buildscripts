#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d findutils-${findutils_version} ] && rm -rf findutils-${findutils_version}

tar -Jxf ${findutils_tarball}

cd findutils-${findutils_version}

./configure --prefix=/usr \
  --localstatedir=/var/lib/locate \
  --host=${LFS_TGT} \
  --build=$(build-aux/config.guess)

make

if [ $? -ne 0 ]; then
  myfail "Failed building findutils"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing findutils"
fi


