#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gperf-${gperf_version} ] && rm -rf gperf-${gperf_version}

tar -zxf ${gperf_tarball}

cd gperf-${gperf_version}

./configure --prefix=/usr \
  --docdir=/usr/share/doc/gperf-${gperf_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building gperf"
fi

echo "running gperf make check"
make -j1 check > ${GLSOURCES}/gperf.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gperf"
fi

