#!/bin/bash

# compiles the toolchain components

/bin/bash CH06.01-m4.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.01-m4.sh"
  exit 1
else
  echo "LFS Chapter 6 M4 Complete"
  sleep 3
fi

/bin/bash CH06.02-ncurses.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.02-ncurses.sh"
  exit 1
else
  echo "LFS Chapter 6 Ncurses Complete"
  sleep 3
fi

/bin/bash CH06.03-bash.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.03-bash.sh"
  exit 1
else
  echo "LFS Chapter 6 Bash Complete"
  sleep 3
fi

/bin/bash CH06.04-coreutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.04-coreutils.sh"
  exit 1
else
  echo "LFS Chapter 6 Coreutils Complete"
  sleep 3
fi

/bin/bash CH06.05-diffutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.05-diffutils.sh"
  exit 1
else
  echo "LFS Chapter 6 Diffutils Complete"
  sleep 3
fi

/bin/bash CH06.06-file.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.06-file.sh"
  exit 1
else
  echo "LFS Chapter 6 File Complete"
  sleep 3
fi

/bin/bash CH06.07-findutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.07-findutils.sh"
  exit 1
else
  echo "LFS Chapter 6 Findutils Complete"
  sleep 3
fi

/bin/bash CH06.08-gawk.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.08-gawk.sh"
  exit 1
else
  echo "LFS Chapter 6 Gawk Complete"
  sleep 3
fi

/bin/bash CH06.09-grep.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.09-grep.sh"
  exit 1
else
  echo "LFS Chapter 6 Grep Complete"
  sleep 3
fi

/bin/bash CH06.10-gzip.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.10-gzip.sh"
  exit 1
else
  echo "LFS Chapter 6 Gzip Complete"
  sleep 3
fi

/bin/bash CH06.11-make.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.11-make.sh"
  exit 1
else
  echo "LFS Chapter 6 Make Complete"
  sleep 3
fi

/bin/bash CH06.12-patch.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.12-patch.sh"
  exit 1
else
  echo "LFS Chapter 6 Patch Complete"
  sleep 3
fi

/bin/bash CH06.13-sed.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.13-sed.sh"
  exit 1
else
  echo "LFS Chapter 6 Sed Complete"
  sleep 3
fi

/bin/bash CH06.14-tar.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.14-tar.sh"
  exit 1
else
  echo "LFS Chapter 6 Tar Complete"
  sleep 3
fi

/bin/bash CH06.15-xz.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.15-xz.sh"
  exit 1
else
  echo "LFS Chapter 6 Xz Complete"
  sleep 3
fi

/bin/bash CH06.16-binutils-pass2.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.16-binutils-pass2.sh"
  exit 1
else
  echo "LFS Chapter 6 Binutils Pass 2 Complete"
  sleep 3
fi

/bin/bash CH06.17-gcc-pass2.sh

if [ $? -ne 0 ]; then
  echo "failed CH06.17-gcc-pass2.sh"
  exit 1
else
  echo "LFS Chapter 6 GCC Pass 2 Complete"
  sleep 120
fi

echo "Continue with Chapter 7"

exit 0
