#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d pkgconf-${pkgconf_version} ] && rm -rf pkgconf-${pkgconf_version}

tar -Jxf ${pkgconf_tarball}

cd pkgconf-${pkgconf_version}

./configure --prefix=/usr \
  --disable-static \
  --docdir=/usr/share/doc/pkgconf-${pkgconf_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building pkgconf"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing pkgconf"
fi

ln -sv pkgconf   /usr/bin/pkg-config
ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1

popd

# cleanup

pushd $GLSOURCES 

rm -rf pkgconf-${pkgconf_version}

popd
