#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d lz4-${lz4_version} ] && rm -rf lz4-${lz4_version}

tar -zxf ${lz4_tarball}

cd lz4-${lz4_version}

make BUILD_STATIC=no PREFIX=/usr
if [ $? -ne 0 ]; then
  myfail "Failed building lz4"
fi

echo "running lz4 make check"
make -j1 check > ${GLSOURCES}/lz4.check 2>&1

make BUILD_STATIC=no PREFIX=/usr install
if [ $? -ne 0 ]; then
  myfail "Failed installing lz4"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf lz4-${lz4_version}

popd
