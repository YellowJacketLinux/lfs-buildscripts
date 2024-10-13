#!/bin/bash

function myfail {
  echo "$1"
  exit 1
}

if [ "`whoami`" != "root" ]; then
  myfail "Must run this script as r00t"
fi

LFS="/mnt/newlfs"

# So USB thumb drive install does not need a network connection
if [ ! -f ${LFS}/USBFlash ]; then
  mkdir -p ${LFS}/home/lfs
  cp /home/lfs/lfs-sources.tar ${LFS}/home/lfs/
  cp -ar /home/lfs/lfs-buildscripts ${LFS}/home/lfs/
  touch ${LFS}/USBFlash
else
  echo "Mounting existing /boot"
  #uncomment below before final build
  #  [ ! -d /mnt/newlfs/boot ] && mkdir /mnt/newlfs/boot
  #  mount /mnt/newlfs/boot
  #  if [ $? -ne 0 ]; then
  #    echo "failed to mount /mnt/newlfs/boot"
  #    exit 1
  #  fi
fi
