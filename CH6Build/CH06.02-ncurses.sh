#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d ncurses-${ncurses_version} ] && rm -rf ncurses-${ncurses_version}

tar -zxf ${ncurses_tarball}

cd ncurses-${ncurses_version}

sed -i s/mawk// configure

mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr \
  --host=${LFS_TGT} \
  --build=$(./config.guess) \
  --mandir=/usr/share/man \
  --with-manpage-format=normal \
  --with-shared \
  --without-normal \
  --with-cxx-shared \
  --without-debug \
  --without-ada \
  --disable-stripping


make

if [ $? -ne 0 ]; then
  myfail "Failed building ncurses"
fi

make DESTDIR=${LFS} TIC_PATH=$(pwd)/build/progs/tic install

if [ $? -ne 0 ]; then
  myfail "Failed installing ncurses"
fi

ln -sv libncursesw.so ${LFS}/usr/lib/libncurses.so
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
  -i ${LFS}/usr/include/curses.h


