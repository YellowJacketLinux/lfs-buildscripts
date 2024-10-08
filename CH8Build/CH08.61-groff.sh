#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d groff-${groff_version} ] && rm -rf groff-${groff_version}

tar -zxf ${groff_tarball}

cd groff-${groff_version}

PAGE=letter ./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building groff"
fi

echo "running groff make check"
make check > ${GLSOURCES}/groff.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing groff"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf groff-${groff_version}

popd
