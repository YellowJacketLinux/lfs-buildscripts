#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d acl-${acl_version} ] && rm -rf acl-${acl_version}

tar -Jxf ${acl_tarball}

cd acl-${acl_version}

./configure --prefix=/usr \
  --disable-static \
  --docdir=/usr/share/doc/acl-${acl_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building acl"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing acl"
fi

