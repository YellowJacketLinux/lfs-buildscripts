#!/bin/bash

LFS=/mnt/newlfs

function myfail {
  echo "$1"
  exit 1
}


if [ "`whoami`" != "root" ]; then
  myfail "Must run this script as r00t"
fi  

mkdir -p ${LFS}/{etc,var} ${LFS}/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -s usr/$i ${LFS}/$i
done

mkdir -p ${LFS}/lib64

mkdir -p ${LFS}/tools

chown lfs ${LFS}/{usr{,/*},lib,var,etc,bin,sbin,tools}
chown lfs ${LFS}/lib64

