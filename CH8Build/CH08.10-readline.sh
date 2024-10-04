#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d readline-${readline_version} ] && rm -rf readline-${readline_version}

tar -zxf ${readline_tarball}

cd readline-${readline_version}

sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install
sed -i 's/-Wl,-rpath,[^ ]*//' support/shobj-conf

./configure --prefix=/usr \
  --disable-static \
  --with-curses \
  --docdir=/usr/share/doc/readline-${readline_version}

make SHLIB_LIBS="-lncursesw" install
if [ $? -ne 0 ]; then
  myfail "Failed building readline"
fi

