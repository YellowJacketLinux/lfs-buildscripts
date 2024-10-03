#!/bin/bash

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

