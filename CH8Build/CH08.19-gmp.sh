#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gmp-${gmp_version} ] && rm -rf gmp-${gmp_version}

tar -Jxf ${gmp_tarball}

cd gmp-${gmp_version}

./configure --prefix=/usr \
            --enable-cxx \
            --disable-static \
            --docdir=/usr/share/doc/gmp-${gmp_version} \
            --host=none-linux-gnu

make
if [ $? -ne 0 ]; then
  myfail "Failed building gmp"
fi
make html
if [ $? -ne 0 ]; then
  myfail "Failed building gmp html"
fi


echo "running gmp make check"
make check > ${GLSOURCES}/gmp.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gmp"
fi
make install-html
if [ $? -ne 0 ]; then
  myfail "Failed installing gmp html"
fi


