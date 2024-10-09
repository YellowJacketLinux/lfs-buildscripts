#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gzip-${gzip_version} ] && rm -rf gzip-${gzip_version}

tar -Jxf ${gzip_tarball}

cd gzip-${gzip_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building gzip"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running gzip make check"
  make check > ${GLSOURCES}/gzip.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gzip"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf gzip-${gzip_version}

popd
