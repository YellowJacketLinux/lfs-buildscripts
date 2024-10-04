#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

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

echo "running xz make check"
make check > ${GLSOURCES}/xz.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing xz"
fi

