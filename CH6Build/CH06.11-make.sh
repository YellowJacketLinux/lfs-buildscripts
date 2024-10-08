#!/bin/bash

source ../versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d make-${make_version} ] && rm -rf make-${make_version}

tar -zxf ${make_tarball}

cd make-${make_version}

./configure --prefix=/usr \
  --without-guile \
  --host=${LFS_TGT} \
  --build=$(build-aux/config.guess)

make

if [ $? -ne 0 ]; then
  myfail "Failed building make"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing make"
fi

popd

# cleanup

pushd ${GLSOURCES}

rm -rf make-${make_version}

popd
