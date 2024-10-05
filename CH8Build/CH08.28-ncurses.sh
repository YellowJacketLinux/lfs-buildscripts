#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d ncurses-${ncurses_version} ] && rm -rf ncurses-${ncurses_version}

tar -zxf ${ncurses_tarball}

cd ncurses-${ncurses_version}

./configure --prefix=/usr \
            --mandir=/usr/share/man \
            --with-shared \
            --without-debug \
            --without-normal \
            --with-cxx-shared \
            --enable-pc-files \
            --with-pkg-config-libdir=/usr/lib/pkgconfig

make
if [ $? -ne 0 ]; then
  myfail "Failed building ncurses"
fi

make DESTDIR=$PWD/dest install
if [ $? -ne 0 ]; then
  myfail "Failed installing xz"
fi
install -m755 dest/usr/lib/libncursesw.so.6.5 /usr/lib
rm -f dest/usr/lib/libncursesw.so.6.5
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i dest/usr/include/curses.h
cp -a dest/* /

for lib in ncurses form panel menu ; do
    ln -sf lib${lib}w.so /usr/lib/lib${lib}.so
    ln -sf ${lib}w.pc    /usr/lib/pkgconfig/${lib}.pc
done

ln -sf libncursesw.so /usr/lib/libcurses.so

cp -R doc -T /usr/share/doc/ncurses-${ncurses_version}
