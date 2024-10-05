#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d sed-${sed_version} ] && rm -rf sed-${sed_version}

tar -Jxf ${sed_tarball}

cd sed-${sed_version}

./configure --prefix=/usr 

make
if [ $? -ne 0 ]; then
  myfail "Failed building sed"
fi
make html
if [ $? -ne 0 ]; then
  myfail "Failed building sed html"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing sed"
fi
install -d -m755           /usr/share/doc/sed-${sed_version}
install -m644 doc/sed.html /usr/share/doc/sed-${sed_version}

