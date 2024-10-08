#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d texinfo-${texinfo_version} ] && rm -rf texinfo-${texinfo_version}

tar -Jxf ${texinfo_tarball}

cd texinfo-${texinfo_version}

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building texinfo"
fi

echo "running texinfo make check"
make check > ${GLSOURCES}/texinfo.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing texinfo"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf texinfo-${texinfo_version}

popd
