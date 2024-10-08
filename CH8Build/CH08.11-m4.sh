#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d m4-${m4_version} ] && rm -rf m4-${m4_version}

tar -Jxf ${m4_tarball}

cd m4-${m4_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building m4"
fi

echo "running m4 make check"
make check > ${GLSOURCES}/m4.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing m4"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf m4-${m4_version}

popd
