#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d autoconf-${autoconf_version} ] && rm -rf autoconf-${autoconf_version}

tar -Jxf ${autoconf_tarball}

cd autoconf-${autoconf_version}

./configure --prefix=/usr 

make
if [ $? -ne 0 ]; then
  myfail "Failed building autoconf"
fi

echo "running autoconf make check"
make check > ${GLSOURCES}/autoconf.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing autoconf"
fi

