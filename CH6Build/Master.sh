#!/bin/bash

# compiles the toolchain components

/bin/bash CH06.01-m4.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.01-m4.sh"
  exit 1
else
  echo "LFS Chapter 6 M4 Complete [1/17]"
  sleep 3
fi

/bin/bash CH06.02-ncurses.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.02-ncurses.sh"
  exit 1
else
  echo "LFS Chapter 6 Ncurses Complete [2/17]"
  sleep 3
fi

/bin/bash CH06.03-bash.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.03-bash.sh"
  exit 1
else
  echo "LFS Chapter 6 Bash Complete [3/17]"
  sleep 3
fi

/bin/bash CH06.04-coreutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.04-coreutils.sh"
  exit 1
else
  echo "LFS Chapter 6 Coreutils Complete [4/17]"
  sleep 3
fi

/bin/bash CH06.05-diffutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.05-diffutils.sh"
  exit 1
else
  echo "LFS Chapter 6 Diffutils Complete [5/17]"
  sleep 3
fi

/bin/bash CH06.06-file.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.06-file.sh"
  exit 1
else
  echo "LFS Chapter 6 File Complete [6/17]"
  sleep 3
fi

/bin/bash CH06.07-findutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.07-findutils.sh"
  exit 1
else
  echo "LFS Chapter 6 Findutils Complete [7/17]"
  sleep 3
fi

/bin/bash CH06.08-gawk.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.08-gawk.sh"
  exit 1
else
  echo "LFS Chapter 6 Gawk Complete [8/17]"
  sleep 3
fi

/bin/bash CH06.09-grep.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.09-grep.sh"
  exit 1
else
  echo "LFS Chapter 6 Grep Complete [9/17]"
  sleep 3
fi

/bin/bash CH06.10-gzip.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.10-gzip.sh"
  exit 1
else
  echo "LFS Chapter 6 Gzip Complete [10/17]"
  sleep 3
fi

/bin/bash CH06.11-make.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.11-make.sh"
  exit 1
else
  echo "LFS Chapter 6 Make Complete [11/17]"
  sleep 3
fi

/bin/bash CH06.12-patch.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.12-patch.sh"
  exit 1
else
  echo "LFS Chapter 6 Patch Complete [12/17]"
  sleep 3
fi

/bin/bash CH06.13-sed.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.13-sed.sh"
  exit 1
else
  echo "LFS Chapter 6 Sed Complete [13/17]"
  sleep 3
fi

/bin/bash CH06.14-tar.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.14-tar.sh"
  exit 1
else
  echo "LFS Chapter 6 Tar Complete [14/17]"
  sleep 3
fi

/bin/bash CH06.15-xz.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.15-xz.sh"
  exit 1
else
  echo "LFS Chapter 6 Xz Complete [15/17]"
  sleep 3
fi

/bin/bash CH06.16-binutils-pass2.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.16-binutils-pass2.sh"
  exit 1
else
  echo "LFS Chapter 6 Binutils Pass 2 Complete [16/17]"
  sleep 3
fi

/bin/bash CH06.17-gcc-pass2.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.17-gcc-pass2.sh"
  exit 1
else
  echo "LFS Chapter 6 GCC Pass 2 Complete [17/17]"
  sleep 120
fi

echo "Continue with Chapter 7"

exit 0
