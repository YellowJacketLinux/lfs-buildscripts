#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d patch-${patch_version} ] && rm -rf patch-${patch_version}

tar -Jxf ${patch_tarball}

cd patch-${patch_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building patch"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running patch make check"
  make check > ${GLSOURCES}/patch.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing patch"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf patch-${patch_version}

popd
