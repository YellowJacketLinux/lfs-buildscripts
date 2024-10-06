#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gzip-${gzip_version} ] && rm -rf gzip-${gzip_version}

tar -Jxf ${gzip_tarball}

cd gzip-${gzip_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building gzip"
fi

echo "running gzip make check"
make check > ${GLSOURCES}/gzip.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gzip"
fi
