#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d expect${expect_version} ] && rm -rf expect${expect_version}

tar -zxf ${expect_tarball}

cd expect${expect_version}

patch -Np1 -i ../${expect_patch_file}

./configure --prefix=/usr \
  --with-tcl=/usr/lib \
  --enable-shared \
  --disable-rpath \
  --mandir=/usr/share/man \
  --with-tclinclude=/usr/include

make
if [ $? -ne 0 ]; then
  myfail "Failed building expect"
fi

echo "running expect make test"
make test > ${GLSOURCES}/expect.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing expect"
fi

ln -svf expect${expect_version}/libexpect${expect_version}.so /usr/lib
