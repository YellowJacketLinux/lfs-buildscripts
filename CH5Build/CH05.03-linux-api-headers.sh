#!/bin/bash

source ../versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d linux-${linux_lts_version} ] && rm -rf linux-${linux_lts_version}

tar -Jxf ${linux_lts_tarball}
cd linux-${linux_lts_version}

make mrproper

make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include ${LFS}/usr


