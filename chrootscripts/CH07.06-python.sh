#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d Python-${python_version} ] && rm -rf Python-${python_version}

tar -Jxf ${python_tarball}

cd Python-${python_version}

./configure --prefix=/usr \
  --enable-shared \
  --without-ensurepip

make

if [ $? -ne 0 ]; then
  myfail "Failed building python"
fi

make install

if [ $? -ne 0 ]; then
  myfail "Failed installing python"
fi
