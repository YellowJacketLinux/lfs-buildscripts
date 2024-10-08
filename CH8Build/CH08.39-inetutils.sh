#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d inetutils-${inetutils_version} ] && rm -rf inetutils-${inetutils_version}

tar -Jxf ${inetutils_tarball}

cd inetutils-${inetutils_version}

sed -i 's/def HAVE_TERMCAP_TGETENT/ 1/' telnet/telnet.c

./configure --prefix=/usr \
            --bindir=/usr/bin \
            --localstatedir=/var \
            --disable-logger \
            --disable-whois \
            --disable-rcp \
            --disable-rexec \
            --disable-rlogin \
            --disable-rsh \
            --disable-servers

make
if [ $? -ne 0 ]; then
  myfail "Failed building inetutils"
fi

echo "running inetutils make check"
make check > ${GLSOURCES}/inetutils.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing inetutils"
fi

mv /usr/{,s}bin/ifconfig

popd

# cleanup

pushd $GLSOURCES 

rm -rf inetutils-${inetutils_version}

popd
