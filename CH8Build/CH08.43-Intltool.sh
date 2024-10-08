#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d intltool-${intltool_version} ] && rm -rf intltool-${intltool_version}

tar -zxf ${intltool_tarball}

cd intltool-${intltool_version}

sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr 

make
if [ $? -ne 0 ]; then
  myfail "Failed building intltool"
fi

echo "running intltool make check"
make check > ${GLSOURCES}/intltool.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing intltool"
fi
install -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-${intltool_version}/I18N-HOWTO

popd

# cleanup

pushd $GLSOURCES 

rm -rf intltool-${intltool_version}

popd
