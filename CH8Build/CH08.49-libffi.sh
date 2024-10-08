#!/bin/bash

# See https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/x86-Options.html
#  for gcc-arch

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libffi-${libffi_version} ] && rm -rf libffi-${libffi_version}

tar -zxf ${libffi_tarball}

cd libffi-${libffi_version}

./configure --prefix=/usr \
  --disable-static \
  --with-gcc-arch=native

make
if [ $? -ne 0 ]; then
  myfail "Failed building libffi"
fi

echo "running libffi make check"
make check > ${GLSOURCES}/libffi.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing libffi"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf libffi-${libffi_version}

popd
