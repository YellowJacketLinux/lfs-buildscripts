#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d xz-${xz_version} ] && rm -rf xz-${xz_version}

tar -Jxf ${xz_tarball}

cd xz-${xz_version}

./configure --prefix=/usr \
  --disable-static \
  --docdir=/usr/share/doc/xz-${xz_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building xz"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running xz make check"
  make check > ${GLSOURCES}/xz.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing xz"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf xz-${xz_version}

popd
