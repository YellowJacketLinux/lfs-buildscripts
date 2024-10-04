#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d flex-${flex_version} ] && rm -rf flex-${flex_version}

tar -zxf ${flex_tarball}

cd flex-${flex_version}

./configure --prefix=/usr \
  --docdir=/usr/share/doc/flex-${flex-version} \
  --disable-static

make
if [ $? -ne 0 ]; then
  myfail "Failed building flex"
fi

echo "running flex make check"
make check > ${GLSOURCES}/flex.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing flex"
fi

ln -sv flex   /usr/bin/lex
ln -sv flex.1 /usr/share/man/man1/lex.1
