#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d kbd-${kbd_version} ] && rm -rf kbd-${kbd_version}

tar -Jxf ${kbd_tarball}

cd kbd-${kbd_version}

patch -Np1 -i ../${kbd_patch_file}

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

./configure --prefix=/usr --disable-vlock

make
if [ $? -ne 0 ]; then
  myfail "Failed building kbd"
fi

echo "running kbd make check"
make check > ${GLSOURCES}/kbd.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing kbd"
fi

cp -R docs/doc -T /usr/share/doc/kbd-${kbd_version}

