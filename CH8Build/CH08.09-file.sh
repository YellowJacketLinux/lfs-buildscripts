#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d file-${file_version} ] && rm -rf file-${file_version}

tar -zxf ${file_tarball}

cd file-${file_version}

./configure --prefix=/usr 

make
if [ $? -ne 0 ]; then
  myfail "Failed building file"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running file make check"
  make check > ${GLSOURCES}/file.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing file"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf file-${file_version}

popd
