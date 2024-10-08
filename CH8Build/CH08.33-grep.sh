#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d grep-${grep_version} ] && rm -rf grep-${grep_version}

tar -Jxf ${grep_tarball}

cd grep-${grep_version}

sed -i "s/echo/#echo/" src/egrep.sh

./configure --prefix=/usr 

make
if [ $? -ne 0 ]; then
  myfail "Failed building grep"
fi

echo "running grep make check"
make check > ${GLSOURCES}/grep.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing grep"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf grep-${grep_version}

popd
