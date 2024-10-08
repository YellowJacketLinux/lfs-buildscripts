#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d expat-${expat_version} ] && rm -rf expat-${expat_version}

tar -Jxf ${expat_tarball}

cd expat-${expat_version}

./configure --prefix=/usr \
  --disable-static \
  --docdir=/usr/share/doc/expat-${expat_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building expat"
fi

echo "running expat make check"
make check > ${GLSOURCES}/expat.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing expat"
fi

install -m644 doc/*.{html,css} /usr/share/doc/expat-${expat_version}

popd

# cleanup

pushd $GLSOURCES 

rm -rf expat-${expat_version}

popd
