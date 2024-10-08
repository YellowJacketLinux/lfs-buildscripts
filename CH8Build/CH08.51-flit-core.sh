#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d flit_core-${flit_core_version} ] && rm -rf flit_core-${flit_core_version}

tar -zxf ${flit_core_tarball}

cd flit_core-${flit_core_version}

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
if [ $? -ne 0 ]; then
  myfail "Failed building flit_core"
fi

pip3 install --no-index --no-user --find-links dist flit_core
if [ $? -ne 0 ]; then
  myfail "Failed installing xz"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf flit_core-${flit_core_version}

popd
