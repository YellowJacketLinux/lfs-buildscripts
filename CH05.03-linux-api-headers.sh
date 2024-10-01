#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

function myfail {
  echo "$1"
  exit 1
}


if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

tar -Jxf ${linux_lts_tarball}
cd linux-${linux_lts_version}

make mrproper

make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include ${LFS}/usr


