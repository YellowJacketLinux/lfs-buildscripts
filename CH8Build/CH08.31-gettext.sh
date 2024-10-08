#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gettext-${gettext_version} ] && rm -rf gettext-${gettext_version}

tar -Jxf ${gettext_tarball}

cd gettext-${gettext_version}

./configure --prefix=/usr \
  --disable-static \
  --docdir=/usr/share/doc/gettext-${gettext_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building gettext"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running gettext make check"
  make check > ${GLSOURCES}/gettext.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gettext"
fi
chmod 0755 /usr/lib/preloadable_libintl.so

popd

# cleanup

pushd $GLSOURCES 

rm -rf gettext-${gettext_version}

popd
