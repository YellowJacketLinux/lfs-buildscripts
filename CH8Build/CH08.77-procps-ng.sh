#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

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

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running procps-ng make check"
  chown -R tester .
  su tester -c "PATH=$PATH make check > procps-ng.check.log"
  mv procps-ng.check.log ${GLSOURCES}/
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing procps-ng"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf procps-ng-${procps_version}

popd
