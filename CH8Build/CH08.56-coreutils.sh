#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d coreutils-${coreutils_version} ] && rm -rf coreutils-${coreutils_version}

tar -Jxf ${coreutils_tarball}

cd coreutils-${coreutils_version}

patch -Np1 -i ../${coreutils_patch_file}

autoreconf -fiv

FORCE_UNSAFE_CONFIGURE=1 ./configure \
  --prefix=/usr \
  --enable-no-install-program=kill,uptime

make
if [ $? -ne 0 ]; then
  myfail "Failed building coreutils"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing coreutils"
fi

mv /usr/bin/chroot /usr/sbin
mv /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

