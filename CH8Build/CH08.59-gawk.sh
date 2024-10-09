#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gawk-${gawk_version} ] && rm -rf gawk-${gawk_version}

tar -Jxf ${gawk_tarball}

cd gawk-${gawk_version}

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building gawk"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running gawk make check"
  chown -R tester .
  su tester -c "PATH=$PATH make check > gawk.check.log"
  mv gawk.check.log ${GLSOURCES}/
fi

rm -f /usr/bin/gawk-${gawk_version}
make install
if [ $? -ne 0 ]; then
  myfail "Failed installing xz"
fi
ln -sv gawk.1 /usr/share/man/man1/awk.1

mkdir -p /usr/share/doc/gawk-${gawk_version}
cp doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-${gawk_version}

popd

# cleanup

pushd $GLSOURCES 

rm -rf gawk-${gawk_version}

popd
