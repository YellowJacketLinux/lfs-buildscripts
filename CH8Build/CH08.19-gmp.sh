#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

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

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running gmp make check"
  make check > ${GLSOURCES}/gmp.check.log 2>&1
  awk '/# PASS:/{total+=$3} ; END{print total}' ${GLSOURCES}/gmp.check.log > ${GLSOURCES}/gmp.check.pass.log
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gmp"
fi
make install-html
if [ $? -ne 0 ]; then
  myfail "Failed installing gmp html"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf gmp-${gmp_version}

popd
