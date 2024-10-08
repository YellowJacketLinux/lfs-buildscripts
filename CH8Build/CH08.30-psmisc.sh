#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d psmisc-${psmisc_version} ] && rm -rf psmisc-${psmisc_version}

tar -Jxf ${psmisc_tarball}

cd psmisc-${psmisc_version}

./configure --prefix=/usr 

make
if [ $? -ne 0 ]; then
  myfail "Failed building psmisc"
fi

echo "running psmisc make check"
make check > ${GLSOURCES}/psmisc.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing psmisc"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf psmisc-${psmisc_version}

popd
