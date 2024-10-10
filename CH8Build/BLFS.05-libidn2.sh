#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libidn2-${libidn2_version} ] && rm -rf libidn2-${libidn2_version}

tar -zxf ${libidn2_tarball}

cd libidn2-${libidn2_version}

./configure --prefix=/usr \
  --disable-static 

make
if [ $? -ne 0 ]; then
  myfail "Failed building libidn2"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libidn2"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf libidn2-${libidn2_version}

popd
