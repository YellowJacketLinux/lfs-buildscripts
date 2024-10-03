#!/bin/bash

# compiles the toolchain components

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

# If works, start over to see if ada,d build
