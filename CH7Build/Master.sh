#!/bin/bash

/bin/bash CH07.01-gettext.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.01-gettext.sh"
  exit 1
else
  echo "LFS Chapter 7 Gettext Complete [1/6]"
  sleep 3
fi

/bin/bash CH07.02-bison.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.02-bison.sh"
  exit 1
else
  echo "LFS Chapter 7 Bison Complete [2/6]"
  sleep 3
fi

/bin/bash CH07.03-perl.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.03-perl.sh"
  exit 1
else
  echo "LFS Chapter 7 Perl Complete [3/6]"
  sleep 3
fi

/bin/bash CH07.04-python.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.04-python.sh"
  exit 1
else
  echo "LFS Chapter 7 Python Complete [4/6]"
  sleep 3
fi

/bin/bash CH07.05-texinfo.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.05-texinfo.sh"
  exit 1
else
  echo "LFS Chapter 7 Texinfo Complete [5/6]"
  sleep 3
fi

/bin/bash CH07.06-util-linux.sh

if [ $? -ne 0 ]; then
  echo "failed CH07.06-util-linux.sh"
  exit 1
else
  echo "LFS Chapter 7 Util-Linux Complete [6/6]"
  sleep 3
fi

LFS=/mnt/newlfs

rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools

echo "### leave the chroot environment and unmount virtual file systems:"
echo
echo "exit"
echo "mountpoint -q ${LFS}/dev/shm && umount ${LFS}/dev/shm"
echo "umount ${LFS}/dev/pts"
echo "umount ${LFS}/{sys,proc,run,dev}"
echo
echo "### then execute the following commands to backup the tools build:"
echo
echo "cd ${LFS}"
echo "rm -rf sources && mkdir sources"
echo "chown lfs sources"
echo "tar -cJpf ${HOME}/lfs-temp-tools-12.2-systemd.tar.xz ."

exit 0
