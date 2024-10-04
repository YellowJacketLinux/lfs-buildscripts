#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d dejagnu-${dejagnu_version} ] && rm -rf dejagnu-${dejagnu_version}

tar -zxf ${dejagnu_tarball}

cd dejagnu-${dejagnu_version}

mkdir build && cd build

../configure --prefix=/usr 

makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi

echo "running dejagnu make check"
make check > ${GLSOURCES}/dejagnu.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing dejagnu"
fi

install -v -dm755  /usr/share/doc/dejagnu-${dejagnu_version}
install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-${dejagnu_version}


