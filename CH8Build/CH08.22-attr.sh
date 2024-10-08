#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d attr-${attr_version} ] && rm -rf attr-${attr_version}

tar -zxf ${attr_tarball}

cd attr-${attr_version}

./configure --prefix=/usr \
  --disable-static \
  --sysconfdir=/etc \
  --docdir=/usr/share/doc/attr-${attr_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building attr"
fi

echo "running attr make check"
make check > ${GLSOURCES}/attr.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing attr"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf attr-${attr_version}

popd
