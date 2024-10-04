#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d mpfr-${mpfr_version} ] && rm -rf mpfr-${mpfr_version}

tar -Jxf ${mpfr_tarball}

cd mpfr-${mpfr_version}

./configure --prefix=/usr \
  --disable-static \
  --enable-thread-safe \
  --docdir=/usr/share/doc/mpfr-${mpfr_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building mpfr"
fi
make html
if [ $? -ne 0 ]; then
  myfail "Failed building mpfr html"
fi

echo "running mpfr make check"
make check > ${GLSOURCES}/mpfr.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing mpfr"
fi
make install-html
if [ $? -ne 0 ]; then
  myfail "Failed installing mpfr html"
fi


