#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gperf-${gperf_version} ] && rm -rf gperf-${gperf_version}

tar -zxf ${gperf_tarball}

cd gperf-${gperf_version}

./configure --prefix=/usr \
  --docdir=/usr/share/doc/gperf-${gperf_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building gperf"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running gperf make check"
  make -j1 check > ${GLSOURCES}/gperf.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gperf"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf gperf-${gperf_version}

popd
