#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d systemd-${systemd_version} ] && rm -rf systemd-${systemd_version}

tar -zxf ${systemd_tarball}

cd systemd-${systemd_version}

sed -i -e 's/GROUP="render"/GROUP="video"/' \
       -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in

mkdir build && cd build

meson setup .. \
  --prefix=/usr           \
  --buildtype=release     \
  -D default-dnssec=no    \
  -D firstboot=false      \
  -D install-tests=false  \
  -D ldconfig=false       \
  -D sysusers=false       \
  -D rpmmacrosdir=no      \
  -D homed=disabled       \
  -D userdb=false         \
  -D man=disabled         \
  -D mode=release         \
  -D pamconfdir=no        \
  -D dev-kvm-mode=0660    \
  -D nobody-group=nogroup \
  -D sysupdate=disabled   \
  -D ukify=disabled       \
  -D docdir=/usr/share/doc/systemd-${systemd_version} 

ninja
if [ $? -ne 0 ]; then
  myfail "Failed building systemd"
fi

echo 'NAME="Linux From Scratch"' > /etc/os-release

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running systemd ninja test"
  ninja test > ${GLSOURCES}/systemd.check.log 2>&1
fi

ninja install
if [ $? -ne 0 ]; then
  myfail "Failed installing systemd"
fi

tar -xf ../../${systemd_man_tarball} \
  --no-same-owner --strip-components=1   \
  -C /usr/share/man

systemd-machine-id-setup

systemctl preset-all

popd

# cleanup

pushd $GLSOURCES 

rm -rf systemd-${systemd_version}

popd
