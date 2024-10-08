#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d zstd-${zstd_version} ] && rm -rf zstd-${zstd_version}

tar -zxf ${zstd_tarball}

cd zstd-${zstd_version}

make prefix=/usr
if [ $? -ne 0 ]; then
  myfail "Failed building zstd"
fi

echo "running zstd make check"
make check > ${GLSOURCES}/zstd.check 2>&1

make prefix=/usr install
if [ $? -ne 0 ]; then
  myfail "Failed installing zstd"
fi

rm -f /usr/lib/libzstd.a

popd

# cleanup

pushd $GLSOURCES 

rm -rf zstd-${zstd_version}

popd
