#!/bin/bash

function myfail {
  echo "$1"
  exit 1
}

if [ "`whoami`" != "root" ]; then
  myfail "Must run this script as r00t"
fi

LFS=/mnt/newlfs
#LFS=/home/mpeters/newlfs

cp -ar chrootscripts ${LFS}/sources/
cp -ar CH8Build ${LFS}/sources/
cp versions.sh ${LFS}/sources/chrootscripts/
cp versions.sh ${LFS}/sources/CH8Build/

chown --from lfs -R root:root ${LFS}/{usr,lib,var,etc,bin,sbin,tools}

chown --from lfs -R root:root ${LFS}/lib64

mkdir -pv ${LFS}/{dev,proc,sys,run}

mount -v --bind /dev ${LFS}/dev

mount -vt devpts devpts -o gid=5,mode=0620 ${LFS}/dev/pts
mount -vt proc proc ${LFS}/proc
mount -vt sysfs sysfs ${LFS}/sys
mount -vt tmpfs tmpfs ${LFS}/run

if [ -h ${LFS}/dev/shm ]; then
  install -v -d -m 1777 ${LFS}$(realpath /dev/shm)
else
  mount -vt tmpfs -o nosuid,nodev tmpfs ${LFS}/dev/shm
fi

echo "Continue in chroot. Command:"
echo
echo "chroot \"$LFS\" /usr/bin/env -i  \\"
echo "    HOME=/root                     \\"
echo "    TERM=\"\$TERM\"                   \\"
echo "    PS1='(lfs chroot) \\u:\\w\\\$ '    \\"
echo "    PATH=/usr/bin:/usr/sbin        \\"
echo "    MAKEFLAGS=\"-j\$(nproc)\"         \\"
echo "    TESTSUITEFLAGS=\"-j\$(nproc)\"    \\"
echo "    /bin/bash --login"

exit 0
