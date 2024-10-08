#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d bc-${bc_version} ] && rm -rf bc-${bc_version}

tar -Jxf ${bc_tarball}

cd bc-${bc_version}

CC=gcc ./configure --prefix=/usr -G -O3 -r

make
if [ $? -ne 0 ]; then
  myfail "Failed building bc"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running bc make test"
  make test > ${GLSOURCES}/bc.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing bc"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf bc-${bc_version}

popd
