#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d mpc-${mpc_version} ] && rm -rf mpc-${mpc_version}

tar -zxf ${mpc_tarball}

cd mpc-${mpc_version}

./configure --prefix=/usr \
  --disable-static \
  --docdir=/usr/share/doc/mpc-${mpc_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building mpc"
fi
make html
if [ $? -ne 0 ]; then
  myfail "Failed building mpc html"
fi

echo "running mpc make check"
make check > ${GLSOURCES}/mpc.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing mpc"
fi
make install-html
if [ $? -ne 0 ]; then
  myfail "Failed installing mpc html"
fi


