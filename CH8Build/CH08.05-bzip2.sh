#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d bzip2-${bzip2_version} ] && rm -rf bzip2-${bzip2_version}

tar -zxf ${bzip2_tarball}

cd bzip2-${bzip2_version}

patch -Np1 -i ../${bzip2_patch_file}

sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

make -f Makefile-libbz2_so
if [ $? -ne 0 ]; then
  myfail "Failed building libbz2.so"
fi

make clean

make
if [ $? -ne 0 ]; then
  myfail "Failed building bzip2"
fi

make PREFIX=/usr install

if [ $? -ne 0 ]; then
  myfail "Failed installing bzip2"
fi

cp -av libbz2.so.* /usr/lib
ln -sv libbz2.so.${bzip2_version} /usr/lib/libbz2.so

cp -v bzip2-shared /usr/bin/bzip2

for i in /usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 $i
done

rm -fv /usr/lib/libbz2.a

popd

# cleanup

pushd $GLSOURCES 

rm -rf bzip2-${bzip2_version}

popd
