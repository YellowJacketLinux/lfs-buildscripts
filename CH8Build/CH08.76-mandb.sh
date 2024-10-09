#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d man-db-${mandb_version} ] && rm -rf man-db-${mandb_version}

tar -Jxf ${mandb_tarball}

cd man-db-${mandb_version}

./configure --prefix=/usr \
  --docdir=/usr/share/doc/man-db-${mandb_version} \
  --sysconfdir=/etc \
  --disable-setuid \
  --enable-cache-owner=bin \
  --with-browser=/usr/bin/lynx \
  --with-vgrind=/usr/bin/vgrind \
  --with-grap=/usr/bin/grap

make
if [ $? -ne 0 ]; then
  myfail "Failed building man-db"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running man-db make check"
  make check > ${GLSOURCES}/man-db.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing man-db"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf man-db-${mandb_version}

popd
