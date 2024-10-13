#!/bin/bash

source versions.sh

GLSOURCES="/sources"

KVSTRING="${linux_lts_version}-lfs-12.2-systemd"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d linux-${linux_lts_version} ] && rm -rf linux-${linux_lts_version}

tar -Jxf ${linux_lts_tarball}

cd linux-${linux_lts_version}

make mrproper
cp ../lts-kernel-config ./.config

make oldconfig

make
if [ $? -ne 0 ]; then
  myfail "Failed building kernel"
fi

make modules_install
if [ $? -ne 0 ]; then
  myfail "Failed building kernel modules"
fi

rm -f /lib/modules/${linux_lts_version}/build
rm -f /lib/modules/${linux_lts_version}/source
install -D -m644 .config /boot/config-${KVSTRING}
install -m644 System.map /boot/System.map-${KVSTRING}
install -m644 arch/x86_64/boot/bzImage /boot/vmlinuz-${KVSTRING}

cp -r Documentation /usr/share/doc/linux/linux-${linux_lts_version}

popd

# cleanup

pushd ${GLSOURCES}

rm -rf linux-${linux_lts_version}

# only write grub configuration for USBFlash
if [ ! -f /USBFlash ]; then
  echo "Manually update the /boot/grub/grub.cfg file."
  echo "In theory, you can shut down, remove the thumb drive, and boot!"
  exit 0
fi

[ ! -d /boot/grub ] && mkdir /boot/grub

cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2
search --set=root --fs-uuid add2119a-1a46-4c72-b212-863ee869ebd1

EOF

echo "#USB Flash Grub" >> /boot/grub/grub.cfg
echo "" >> /boot/grub/grub.cfg
echo "menuentry \"GNU/Linux, Linux ${KVSTRING}\" {" \
  >> /boot/grub/grub.cfg
echo "  linux /boot/vmlinuz-${KVSTRING} root=PARTUUID=8d5d11ba-01 ro" \
  >> /boot/grub/grub.cfg
echo "}" >> /boot/grub/grub.cfg

echo "Please verify /boot/grub/grub.cfg is correct."
echo "If so, run grub-install on USB Flash device inside the chroot."

