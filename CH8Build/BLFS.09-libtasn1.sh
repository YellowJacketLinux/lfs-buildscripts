#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libtasn1-${libtasn1_version} ] && rm -rf libtasn1-${libtasn1_version}

tar -zxf ${libtasn1_tarball}

cd libtasn1-${libtasn1_version}

./configure --prefix=/usr \
  --disable-static 

make
if [ $? -ne 0 ]; then
  myfail "Failed building libtasn1"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running libtasn1 make check"
  make check > ${GLSOURCES}/libtasn1.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libtasn1"
fi

make -C doc/reference install-data-local

popd

# cleanup

pushd $GLSOURCES 

rm -rf libtasn1-${libtasn1_version}

popd
