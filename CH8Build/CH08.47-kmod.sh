#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d kmod-${kmod_version} ] && rm -rf kmod-${kmod_version}

tar -Jxf ${kmod_tarball}

cd kmod-${kmod_version}

./configure --prefix=/usr \
            --sysconfdir=/etc \
            --with-openssl \
            --with-xz \
            --with-zstd \
            --with-zlib \
            --disable-manpages

make
if [ $? -ne 0 ]; then
  myfail "Failed building kmod"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing kmod"
fi
for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
  rm -fv /usr/bin/$target
done

popd

# cleanup

pushd $GLSOURCES 

rm -rf kmod-${kmod_version}

popd
