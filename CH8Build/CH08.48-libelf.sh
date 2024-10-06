#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d elfutils-${elfutils_version} ] && rm -rf elfutils-${elfutils_version}

tar -jxf ${elfutils_tarball}

cd elfutils-${elfutils_version}

./configure --prefix=/usr \
  --disable-debuginfod \
  --enable-libdebuginfod=dummy

make
if [ $? -ne 0 ]; then
  myfail "Failed building libelf"
fi

echo "running elfutils make check"
make check > ${GLSOURCES}/elfutils.check 2>&1

make -C libelf install
if [ $? -ne 0 ]; then
  myfail "Failed installing libelf"
fi
install -m644 config/libelf.pc /usr/lib/pkgconfig
rm -f /usr/lib/libelf.a

