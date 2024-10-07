#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d patch-${patch_version} ] && rm -rf patch-${patch_version}

tar -Jxf ${patch_tarball}

cd patch-${patch_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building patch"
fi

echo "running patch make check"
make check > ${GLSOURCES}/patch.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing patch"
fi

