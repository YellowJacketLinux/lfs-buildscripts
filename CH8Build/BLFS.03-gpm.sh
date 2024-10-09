#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gpm-${gpm_version} ] && rm -rf gpm-${gpm_version}

tar -jxf ${gpm_tarball}

cd gpm-${gpm_version}

patch -Np1 -i ../${gpm_patch_file}

./autogen.sh

./configure --prefix=/usr \
  --sysconfdir=/etc \
  ac_cv_path_emacs=no

make
if [ $? -ne 0 ]; then
  myfail "Failed building gpm"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gpm"
fi

install-info --dir-file=/usr/share/info/dir /usr/share/info/gpm.info

rm -f /usr/lib/libgpm.a
ln -sf libgpm.so.2.1.0 /usr/lib/libgpm.so
install -m644 conf/gpm-root.conf /etc
install -m755 -d /usr/share/doc/gpm-${gpm_version}/support
install -m644 doc/support/* /usr/share/doc/gpm-${gpm_version}/support
install -m644 doc/{FAQ,HACK_GPM,README*} /usr/share/doc/gpm-${gpm_version}/support

pushd /usr/local/src/blfs-systemd-units-${systemd_units_version}
make install-gpm
if [ $? -ne 0 ]; then
  myfail "Failed installing gpm systemd script"
fi
popd

popd

# cleanup

pushd $GLSOURCES 

rm -rf gpm-${gpm_version}

popd
