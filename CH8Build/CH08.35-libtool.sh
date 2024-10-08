#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libtool-${libtool_version} ] && rm -rf libtool-${libtool_version}

tar -Jxf ${libtool_tarball}

cd libtool-${libtool_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building libtool"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running libtool make check"
  make -k check > ${GLSOURCES}/libtool.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libtool"
fi

rm -f /usr/lib/libltdl.a

popd

# cleanup

pushd $GLSOURCES 

rm -rf libtool-${libtool_version}

popd
