#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d e2fsprogs-${e2fsprogs_version} ] && rm -rf e2fsprogs-${e2fsprogs_version}

tar -zxf ${e2fsprogs_tarball}

cd e2fsprogs-${e2fsprogs_version}

mkdir build && cd build

../configure --prefix=/usr \
  --sysconfdir=/etc       \
  --enable-elf-shlibs     \
  --disable-libblkid      \
  --disable-libuuid       \
  --disable-uuidd         \
  --disable-fsck

make
if [ $? -ne 0 ]; then
  myfail "Failed building e2fsprogs"
fi

echo "running e2fsprogs make check"
make check > ${GLSOURCES}/e2fsprogs.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing e2fsprogs"
fi

rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

# may not be needed soon but...
sed 's/metadata_csum_seed,//' -i /etc/mke2fs.conf

popd

# cleanup

pushd $GLSOURCES 

rm -rf e2fsprogs-${e2fsprogs_version}

popd
