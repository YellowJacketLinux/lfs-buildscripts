#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d automake-${automake_version} ] && rm -rf automake-${automake_version}

tar -Jxf ${automake_tarball}

cd automake-${automake_version}

./configure --prefix=/usr \
  --docdir=/usr/share/doc/automake-${automake_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building automake"
fi

echo "running automake make check"
make -j$(($(nproc)>4?$(nproc):4)) check > ${GLSOURCES}/automake.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing automake"
fi

