#!/bin/bash

source versions.sh

GLSOURCES="${LFS}/sources"

if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d bash-${bash_version} ] && rm -rf bash-${bash_version}

tar -zxf ${bash_tarball}

cd bash-${bash_version}

./configure --prefix=/usr \
  --build=$(sh support/config.guess) \
  --host=${LFS_TGT} \
  --without-bash-malloc \
  bash_cv_strtold_broken=no

make

if [ $? -ne 0 ]; then
  myfail "Failed building bash"
fi

make DESTDIR=${LFS} install

if [ $? -ne 0 ]; then
  myfail "Failed installing bash"
fi

ln -s bash ${LFS}/bin/sh


