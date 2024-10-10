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
if [ ! -d ${LFS}/home/lfs ]; then
  if [ ! -f /home/lfs/lfs-buildscripts/USBFlash ]; then
    mkdir -p ${LFS}/home/lfs
    cp /home/lfs/lfs-sources.tar ${LFS}/home/lfs/
    cp -ar /home/lfs/lfs-buildscripts ${LFS}/home/lfs/
    touch ${LFS}/home/lfs/lfs-buildscripts/USBFlash
  fi
fi