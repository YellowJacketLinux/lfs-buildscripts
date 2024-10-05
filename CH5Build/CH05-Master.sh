#!/bin/bash

LFS="/mnt/newlfs"

/bin/bash CH05.01-binutils-pass1.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.01-binutils-pass1.sh"
  exit 1
else
  echo "LFS Chapter 5 binutils Pass 1 complete"
  sleep 3
fi

/bin/bash CH05.02-gcc-pass1.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.02-gcc-pass1.sh"
  exit 1
else
  echo "LFS Chapter 5 GCC Pass 1 complete"
  # warms up the CPU
  sleep 60
fi

/bin/bash CH05.03-linux-api-headers.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.03-linux-api-headers.sh"
  exit 1
else
  echo "LFS Chapter 5 Linux API Headers complete"
  sleep 3
fi

echo "As root, issue following two commands:"

echo "ln -sfv ../lib/ld-linux-x86-64.so.2 ${LFS}/lib64"
echo "ln -sfv ../lib/ld-linux-x86-64.so.2 ${LFS}/lib64/ld-lsb-x86-64.so.3"
