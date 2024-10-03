#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d coreutils-${coreutils_version} ] && rm -rf coreutils-${coreutils_version}

tar -Jxf ${coreutils_tarball}

cd coreutils-${coreutils_version}

./configure --prefix=/usr \
  --host=${LFS_TGT} \
  --build=$(build-aux/config.guess) \
  --enable-install-program=hostname \
  --enable-no-install-program=kill,uptime

make

if [ $? -ne 0 ]; then
  myfail "Failed building coreutils"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing coreutils"
fi

mv ${LFS}/usr/bin/chroot ${LFS}/usr/sbin
mkdir -p ${LFS}/usr/share/man/man8
mv ${LFS}/usr/share/man/man1/chroot.1 ${LFS}/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' ${LFS}/usr/share/man/man8/chroot.8



