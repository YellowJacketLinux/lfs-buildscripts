#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d make-${make_version} ] && rm -rf make-${make_version}

tar -zxf ${make_tarball}

cd make-${make_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building make"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running make make check"
  chown -R tester .
  su tester -c "PATH=$PATH make check > make.check.log 2>&1"
  mv make.check.log ${GLSOURCES}/
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing make"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf make-${make_version}

popd
