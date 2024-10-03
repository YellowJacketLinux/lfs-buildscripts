#!/bin/bash

LFS=/mnt/newlfs
#LFS=/home/mpeters/newlfs

function myfail {
  echo "$1"
  exit 1
}


if [ "`whoami`" != "root" ]; then
  myfail "Must run this script as r00t"
fi  

mkdir -pv ${LFS}/{etc,var} ${LFS}/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i ${LFS}/$i
done

case $(uname -m) in
  x86_64) mkdir -pv ${LFS}/lib64 ;;
esac

mkdir -pv ${LFS}/tools

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

chown -v lfs ${LFS}/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v ${LFS}/lib64 ;;
esac

echo "Please set a password for the lfs user account"
echo ""
echo "    passwd lfs"
