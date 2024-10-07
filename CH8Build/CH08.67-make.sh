#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d make-${make_version} ] && rm -rf make-${make_version}

tar -zxf ${make_tarball}

cd make-${make_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building make"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing make"
fi

