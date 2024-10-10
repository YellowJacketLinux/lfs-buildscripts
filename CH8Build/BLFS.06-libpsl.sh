#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libpsl-${libpsl_version} ] && rm -rf libpsl-${libpsl_version}

tar -zxf ${libpsl_tarball}

cd libpsl-${libpsl_version}

mkdir build && cd build

meson setup --prefix=/usr --buildtype=release 

ninja
if [ $? -ne 0 ]; then
  myfail "Failed building libpsl"
fi

ninja install
if [ $? -ne 0 ]; then
  myfail "Failed installing libpsl"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf libpsl-${libpsl_version}

popd
