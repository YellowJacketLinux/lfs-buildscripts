#!/bin/bash

# LFS user on flash drive

groupadd lfs
useradd -d /home/lfs -s /bin/bash -g lfs -m -k /dev/null lfs

# fix permissions
chown -R lfs:lfs /home/lfs

# login scripts
cat > /home/lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF
chown lfs:lfs /home/lfs/.bash_profile

cat > /home/lfs/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/newlfs
LC_ALL=POSIX
LFS_TGT=x86_64-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE

# below is conservative but safe
export MAKEFLAGS=-j8
EOF
chown lfs:lfs /home/lfs/.bashrc

echo "Please set the password for the lfs user:"
echo "   passwd lfs"
echo

