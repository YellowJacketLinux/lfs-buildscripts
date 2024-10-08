#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d setuptools-${setuptools_version} ] && rm -rf setuptools-${setuptools_version}

tar -zxf ${setuptools_tarball}

cd setuptools-${setuptools_version}

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
if [ $? -ne 0 ]; then
  myfail "Failed building setuptools"
fi

pip3 install --no-index --find-links dist setuptools
if [ $? -ne 0 ]; then
  myfail "Failed installing setuptools"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf setuptools-${setuptools_version}

popd
