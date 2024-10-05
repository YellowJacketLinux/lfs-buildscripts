#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libressl-${libressl_version} ] && rm -rf libressl-${libressl_version}

tar -zxf ${libressl_tarball}

cd libressl-${libressl_version}

patch -p1 < libressl-${libressl_version}-cnf-name.patch
mv openssl.cnf libressl.cnf
mv man/openssl.cnf.5 man/libressl.cnf
pushd apps/openssl

sed -i 's?openssl.1?libressl.1?' openssl.1
sed -i 's?^.Nd OpenSSL?.Nd LibreSSL?g' openssl.1
sed -i 's?^.Nm openssl ?.Nm libressl ?g' openssl.1
sed -i 's?^.Nm openssl$?.Nm libressl?g' openssl.1
sed -i 's?^.It Nm openssl ?.It Nm libressl ?g' openssl.1
sed -i 's?^.Cm openssl ?.Cm libressl ?g' openssl.1
sed -i 's?^.Bl -hang -width "openssl?.Bl -hang -width "libressl?g' openssl.1
mv openssl.1 libressl.1

sed -i 's?openssl.1?libressl.1?' CMakeLists.txt
sed -i 's?openssl.1?libressl.1?' Makefile.am
sed -i 's?openssl.1?libressl.1?' Makefile.in
popd

./configure --prefix=/usr \
  --with-openssldir=/etc/ssl \
  --libdir=/usr/lib

make
if [ $? -ne 0 ]; then
  myfail "Failed building libressl"
fi

echo "running libressl make check"
make check > ${GLSOURCES}/libressl.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libressl"
fi
