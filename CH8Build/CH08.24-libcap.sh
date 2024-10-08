#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d libcap-${libcap_version} ] && rm -rf libcap-${libcap_version}

tar -Jxf ${libcap_tarball}

cd libcap-${libcap_version}

sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib
if [ $? -ne 0 ]; then
  myfail "Failed building libcap"
fi

echo "running libcap make test"
make test > ${GLSOURCES}/libcap.check 2>&1

make prefix=/usr lib=lib install
if [ $? -ne 0 ]; then
  myfail "Failed installing libcap"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf libcap-${libcap_version}

popd
