#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d curl-${curl_version} ] && rm -rf curl-${curl_version}

tar -Jxf ${curl_tarball}

cd curl-${curl_version}

./configure --prefix=/usr \
  --disable-static \
  --with-openssl \
  --with-ca-path=/etc/ssl/certs

make
if [ $? -ne 0 ]; then
  myfail "Failed building curl"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing curl"
fi

rm -rf docs/examples/.deps

find docs \( -name Makefile\* -o  \
             -name \*.1       -o  \
             -name \*.3       -o  \
             -name CMakeLists.txt \) -delete

cp -R docs -T /usr/share/doc/curl-${curl_version}

popd

# cleanup

pushd $GLSOURCES 

rm -rf curl-${curl_version}

popd
