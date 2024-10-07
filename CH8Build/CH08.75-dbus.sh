#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d dbus-${dbus_version} ] && rm -rf dbus-${dbus_version}

tar -Jxf ${dbus_tarball}

cd dbus-${dbus_version}

./configure --prefix=/usr \
  --sysconfdir=/etc \
  --localstatedir=/var \
  --runstatedir=/run \
  --enable-user-session \
  --disable-static \
  --disable-doxygen-docs \
  --disable-xml-docs \
  --docdir=/usr/share/doc/dbus-${dbus_version} \
  --with-system-socket=/run/dbus/system_bus_socket

make
if [ $? -ne 0 ]; then
  myfail "Failed building dbus"
fi

echo "running dbus make check"
make check > ${GLSOURCES}/dbus.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing dbus"
fi
ls -sf /etc/machine-id /var/lib/dbus

 
