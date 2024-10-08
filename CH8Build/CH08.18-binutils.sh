#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

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

# LFS book says not to skip under any circumstances and I agree but tests really
#  slow down development so I say when building final system, do not skip ANY
#  of the tests but okay to skip when making USB boot thumb drive to do the
#  final install from
if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running binutils make check"
  make -k check > ${GLSOURCES}/binutils.check.log 2>&1
  grep '^FAIL:' ${GLSOURCES}/binutils.check.log > ${GLSOURCES}/binutils.check.fail.log
fi

make tooldir=/usr install
if [ $? -ne 0 ]; then
  myfail "Failed installing binutils"
fi

rm -f /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a

popd

# cleanup

pushd $GLSOURCES 

rm -rf binutils-${binutils_version}

popd
