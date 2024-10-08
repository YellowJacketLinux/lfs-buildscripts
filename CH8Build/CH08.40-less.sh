#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d less-${less_version} ] && rm -rf less-${less_version}

tar -zxf ${less_tarball}

cd less-${less_version}

./configure --prefix=/usr \
  --sysconfdir=/etc

make
if [ $? -ne 0 ]; then
  myfail "Failed building less"
fi

echo "running less make check"
make check > ${GLSOURCES}/less.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing less"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf less-${less_version}

popd
