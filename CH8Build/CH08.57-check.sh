#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d check-${check_version} ] && rm -rf check-${check_version}

tar -zxf ${check_tarball}

cd check-${check_version}

./configure --prefix=/usr \
  --disable-static 

make
if [ $? -ne 0 ]; then
  myfail "Failed building check"
fi

echo "running check make check"
make check > ${GLSOURCES}/check.check 2>&1

make docdir=/usr/share/doc/check-${check_version} install
if [ $? -ne 0 ]; then
  myfail "Failed installing check"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf check-${check_version}

popd
