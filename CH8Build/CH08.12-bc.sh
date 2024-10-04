#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d bc-${bc_version} ] && rm -rf bc-${bc_version}

tar -Jxf ${bc_tarball}

cd bc-${bc_version}

CC=gcc ./configure --prefix=/usr -G -03 -r

make
if [ $? -ne 0 ]; then
  myfail "Failed building bc"
fi

echo "running bc make test"
make test > ${GLSOURCES}/bc.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing bc"
fi

