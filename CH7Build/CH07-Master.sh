#!/bin/bash

/bin/bash CH07.01-gettext.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.01-gettext.sh"
  exit 1
else
  echo "LFS Chapter 7 Gettext Complete"
  sleep 3
fi

/bin/bash CH07.02-bison.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.02-bison.sh"
  exit 1
else
  echo "LFS Chapter 7 Bison Complete"
  sleep 3
fi

/bin/bash CH07.03-perl.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.03-perl.sh"
  exit 1
else
  echo "LFS Chapter 7 Perl Complete"
  sleep 3
fi

/bin/bash CH07.04-python.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.04-python.sh"
  exit 1
else
  echo "LFS Chapter 7 Python Complete"
  sleep 3
fi

/bin/bash CH07.05-texinfo.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.05-texinfo.sh"
  exit 1
else
  echo "LFS Chapter 7 Texinfo Complete"
  sleep 3
fi

/bin/bash CH07.06-util-linux.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.06-util-linux.sh"
  exit 1
else
  echo "LFS Chapter 7 Util-Linux Complete"
  sleep 3
fi

LFS=/mnt/newlfs

rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools

echo "leave the chroot environment and unmount virtual file systems."
echo
echo "execute the following commands:"
echo
echo "exit"
echo "mountpoint -q ${LFS}/dev/shm && umount ${LFS}/dev/shm"
echo "umount ${LFS}/dev/pts"
echo "umount ${LFS}/{sys,proc,run,dev}"
echo
echo "cd ${LFS}"
echo "tar -cJpf ${HOME}/lfs-temp-tools-12.2-systemd.tar.xz ."

exit 0
