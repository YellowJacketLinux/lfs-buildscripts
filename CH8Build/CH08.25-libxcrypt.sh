#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libxcrypt-${libxcrypt_version} ] && rm -rf libxcrypt-${libxcrypt_version}

tar -Jxf ${libxcrypt_tarball}

cd libxcrypt-${libxcrypt_version}

./configure --prefix=/usr \
  --enable-hashes=strong,glibc \
  --enable-obsolete-api=no     \
  --disable-static \
  --disable-failure-tokens

make
if [ $? -ne 0 ]; then
  myfail "Failed building libxcrypt"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running libxcrypt make check"
  make check > ${GLSOURCES}/libxcrypt.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libxcrypt"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf libxcrypt-${libxcrypt_version}

popd
