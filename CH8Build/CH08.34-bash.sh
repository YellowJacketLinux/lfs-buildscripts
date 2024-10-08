#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d bash-${bash_version} ] && rm -rf bash-${bash_version}

tar -zxf ${bash_tarball}

cd bash-${bash_version}

./configure --prefix=/usr \
  --without-bash-malloc \
  --with-installed-readline \
  bash_cv_strtold_broken=no \
  --docdir=/usr/share/doc/bash-${bash_version}

make
if [ $? -ne 0 ]; then
  myfail "Failed building bash"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing bash"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf bash-${bash_version}

popd
