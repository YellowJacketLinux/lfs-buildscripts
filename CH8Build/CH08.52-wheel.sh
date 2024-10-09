#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d wheel-${wheel_version} ] && rm -rf wheel-${wheel_version}

tar -zxf ${wheel_tarball}

cd wheel-${wheel_version}

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
if [ $? -ne 0 ]; then
  myfail "Failed building wheel"
fi

pip3 install --no-index --find-links=dist wheel
if [ $? -ne 0 ]; then
  myfail "Failed installing wheel"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf wheel-${wheel_version}

popd
