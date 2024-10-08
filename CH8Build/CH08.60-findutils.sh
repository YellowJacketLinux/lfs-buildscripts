#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d findutils-${findutils_version} ] && rm -rf findutils-${findutils_version}

tar -Jxf ${findutils_tarball}

cd findutils-${findutils_version}

./configure --prefix=/usr \
  --localstatedir=/var/lib/locate

make
if [ $? -ne 0 ]; then
  myfail "Failed building findutils"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing findutils"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf findutils-${findutils_version}

popd
