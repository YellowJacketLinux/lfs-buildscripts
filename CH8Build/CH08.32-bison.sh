#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d bison-${bison_version} ] && rm -rf bison-${bison_version}

tar -Jxf ${bison_tarball}

cd bison-${bison_version}

./configure --prefix=/usr \
  --docdir=/usr/share/doc/bison-${bison_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building bison"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running bison make check"
  make check > ${GLSOURCES}/bison.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing bison"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf bison-${bison_version}

popd
