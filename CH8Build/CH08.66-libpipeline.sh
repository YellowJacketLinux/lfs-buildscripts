#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libpipeline-${libpipeline_version} ] && rm -rf libpipeline-${libpipeline_version}

tar -zxf ${libpipeline_tarball}

cd libpipeline-${libpipeline_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building libpipeline"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running libpipeline make check"
  make check > ${GLSOURCES}/libpipeline.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libpipeline"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf libpipeline-${libpipeline_version}

popd
