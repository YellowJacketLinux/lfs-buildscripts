#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d wget-${wget_version} ] && rm -rf wget-${wget_version}

tar -zxf ${wget_tarball}

cd wget-${wget_version}

./configure --prefix=/usr \
  --sysconfdir=/etc \
  --with-ssl=openssl

make
if [ $? -ne 0 ]; then
  myfail "Failed building wget"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing wget"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf wget-${wget_version}

popd
