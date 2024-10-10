#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libunistring-${libunistring_version} ] && rm -rf libunistring-${libunistring_version}

tar -Jxf ${libunistring_tarball}

cd libunistring-${libunistring_version}

./configure --prefix=/usr \
  --disable-static \
  --docdir=/usr/share/doc/libunistring-${libunistring_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building libunistring"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running libunistring make check"
  make check > ${GLSOURCES}/libunistring.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libunistring"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf libunistring-${libunistring_version}

popd
