#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d openssl-${openssl_version} ] && rm -rf openssl-${openssl_version}

tar -zxf ${openssl_tarball}

cd openssl-${openssl_version}

./config --prefix=/opt/openssl \
            --openssldir=/opt/openssl/ssl \
            --libdir=lib \
            shared \
            zlib-dynamic

make
if [ $? -ne 0 ]; then
  myfail "Failed building openssl"
fi

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
if [ $? -ne 0 ]; then
  myfail "Failed installing openssl"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf openssl-${openssl_version}

popd
