#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d diffutils-${diffutils_version} ] && rm -rf diffutils-${diffutils_version}

tar -Jxf ${diffutils_tarball}

cd diffutils-${diffutils_version}

./configure --prefix=/usr 

make
if [ $? -ne 0 ]; then
  myfail "Failed building diffutils"
fi

echo "running diffutils make check"
make check > ${GLSOURCES}/diffutils.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing diffutils"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf diffutils-${diffutils_version}

popd
