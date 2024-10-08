#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d util-linux-${util_linux_version} ] && rm -rf util-linux-${util_linux_version}

tar -Jxf ${util_linux_tarball}

cd util-linux-${util_linux_version}
[ ! -d /var/lib/hwclock ] && mkdir -p /var/lib/hwclock

./configure --libdir=/usr/lib \
  --runstatedir=/run          \
  --disable-chfn-chsh         \
  --disable-login             \
  --disable-nologin           \
  --disable-su                \
  --disable-setpriv           \
  --disable-runuser           \
  --disable-pylibmount        \
  --disable-static            \
  --disable-liblastlog2       \
  --without-python            \
  ADJTIME_PATH=/var/lib/hwclock/adjtime \
  --docdir=/usr/share/doc/util-linux-${util_linux_version}

make

if [ $? -ne 0 ]; then
  myfail "Failed building util-linux"
fi

make install

if [ $? -ne 0 ]; then
  myfail "Failed installing util-linux"
fi

popd

# cleanup

pushd ${GLSOURCES}

rm -rf util-linux-${util_linux_version}

popd
