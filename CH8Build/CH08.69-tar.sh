#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d tar-${tar_version} ] && rm -rf tar-${tar_version}

tar -Jxf ${tar_tarball}

cd tar-${tar_version}

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building tar"
fi

echo "running tar make check"
make check > ${GLSOURCES}/tar.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing tar"
fi

make -C doc install-html docdir=/usr/share/doc/tar-${tar_version}
