#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d iproute2-${iproute2_version} ] && rm -rf iproute2-${iproute2_version}

tar -Jxf ${iproute2_tarball}

cd iproute2-${iproute2_version}

sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

make NETNS_RUN_DIR=/run/netns
if [ $? -ne 0 ]; then
  myfail "Failed building iproute2"
fi

make SBINDIR=/usr/sbin install
if [ $? -ne 0 ]; then
  myfail "Failed installing iproute2"
fi

mkdir -p /usr/share/doc/iproute2-${iproute2_version}
cp COPYING README* /usr/share/doc/iproute2-${iproute2_version}/

popd

# cleanup

pushd $GLSOURCES 

rm -rf iproute2-${iproute2_version}

popd
