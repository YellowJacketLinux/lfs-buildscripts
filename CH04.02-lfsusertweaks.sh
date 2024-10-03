#!/bin/bash

LFS=/mnt/newlfs
#LFS=/home/mpeters/newlfs

function myfail {
  echo "$1"
  exit 1
}


if [ "`whoami`" != "lfs" ]; then
  myfail "Must run this script as lfs user"
fi  

cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/newlfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE

# below is conservative but safe
export MAKEFLAGS=-j8
EOF

echo "type the following"
echo ""
echo "  source ~/.bash_profile"


