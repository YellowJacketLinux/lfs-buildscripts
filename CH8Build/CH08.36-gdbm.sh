#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gdbm-${gdbm_version} ] && rm -rf gdbm-${gdbm_version}

tar -zxf ${gdbm_tarball}

cd gdbm-${gdbm_version}

./configure --prefix=/usr \
  --disable-static \
  --enable-libgdbm-compat

make
if [ $? -ne 0 ]; then
  myfail "Failed building gdbm"
fi

echo "running gdbm make check"
make check > ${GLSOURCES}/gdbm.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gdbm"
fi

