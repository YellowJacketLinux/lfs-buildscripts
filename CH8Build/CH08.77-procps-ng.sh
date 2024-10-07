#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d procps-ng-${procps_version} ] && rm -rf procps-ng-${procps_version}

tar -Jxf ${procps_tarball}

cd procps-ng-${procps_version}

./configure --prefix=/usr \
  --docdir=/usr/share/doc/procps-ng-${procps_version} \
  --disable-static \
  --disable-kill \
  --with-systemd

make src_w_LDADD='$(LDADD) -lsystemd'
if [ $? -ne 0 ]; then
  myfail "Failed building procps-ng"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing procps-ng"
fi

