#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d binutils-${binutils_version} ] && rm -rf binutils-${binutils_version}

tar -Jxf ${binutils_tarball}

cd binutils-${binutils_version}

mkdir build && cd build

../configure --prefix=/usr \
             --sysconfdir=/etc \
             --enable-gold \
             --enable-ld=default \
             --enable-plugins \
             --enable-shared \
             --disable-werror \
             --enable-64-bit-bfd \
             --enable-new-dtags \
             --with-system-zlib \
             --enable-default-hash-style=gnu

make tooldir=/usr
if [ $? -ne 0 ]; then
  myfail "Failed building binutils"
fi

echo "running binutils make check"
make -k check > ${GLSOURCES}/binutils.check 2>&1
grep '^FAIL:' ${GLSOURCES}/binutils.check > ${GLSOURCES}/binutils.check.fail

make tooldir=/usr install
if [ $? -ne 0 ]; then
  myfail "Failed installing binutils"
fi

rm -f /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a

