#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d zlib-${zlib_version} ] && rm -rf zlib-${zlib_version}

tar -zxf ${zlib_tarball}

cd zlib-${zlib_version}

./configure --prefix=/usr

make

if [ $? -ne 0 ]; then
  myfail "Failed building zlib"
fi

echo "Running zlib make check."
make check > ${GLSOURCES}/zlib.check 2>&1

make install

if [ $? -ne 0 ]; then
  myfail "Failed installing zlib"
fi

rm -f /usr/lib/libz.a

popd

# cleanup

pushd $GLSOURCES 

rm -rf zlib-${zlib_version}

popd
