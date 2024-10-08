#!/bin/bash

LFS="/mnt/newlfs"

/bin/bash CH05.01-binutils-pass1.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.01-binutils-pass1.sh"
  exit 1
else
  echo "LFS Chapter 5 binutils Pass 1 complete [1/5]"
  sleep 3
fi

/bin/bash CH05.02-gcc-pass1.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.02-gcc-pass1.sh"
  exit 1
else
  echo "LFS Chapter 5 GCC Pass 1 complete [2/5]"
  sleep 3
fi

/bin/bash CH05.03-linux-api-headers.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.03-linux-api-headers.sh"
  exit 1
else
  echo "LFS Chapter 5 Linux API Headers complete [3/5]"
  sleep 3
fi

ln -sfv ../lib/ld-linux-x86-64.so.2 ${LFS}/lib64
ln -sfv ../lib/ld-linux-x86-64.so.2 ${LFS}/lib64/ld-lsb-x86-64.so.3

/bin/bash CH05.04-glibc.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.03-linux-api-headers.sh"
  exit 1
else
  echo "LFS Chapter 5 Glibc 2.40 complete [4/5]"
  sleep 3
fi

/bin/bash CH05.05-libstdc++.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.05-libstdc++.sh"
  exit 1
else
  echo "LFS Chapter 5 Libstdc++ from GCC 14.2.0 complete [5/5]"
  sleep 3
fi


