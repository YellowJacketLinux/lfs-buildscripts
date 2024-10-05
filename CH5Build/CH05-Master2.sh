#!/bin/bash

/bin/bash CH05.04-glibc.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.03-linux-api-headers.sh"
  exit 1
else
  echo "LFS Chapter 5 Glibc 2.40 complete"
  sleep 3
fi

/bin/bash CH05.05-libstdc++.sh

if [ $? -ne 0 ]; then
  echo "failed CH05.05-libstdc++.sh"
  exit 1
else
  echo "LFS Chapter 5 Libstdc++ from GCC 14.2.0 complete"
  sleep 3
fi


