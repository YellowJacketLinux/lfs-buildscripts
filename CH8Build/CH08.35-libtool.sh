#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libtool-${libtool_version} ] && rm -rf libtool-${libtool_version}

tar -Jxf ${libtool_tarball}

cd libtool-${libtool_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building libtool"
fi

#echo "running libtool make check"
#make -k check > ${GLSOURCES}/libtool.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libtool"
fi

rm -f /usr/lib/libltdl.a
