#!/bin/bash

# compiles the system software

/bin/bash CH08.01-man-pages.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.01-man-pages.sh"
  exit 1
else
  echo "LFS Chapter 8 Man Pages complete"
  sleep 3
fi

/bin/bash CH08.02-iana-etc.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.02-iana-etc.sh"
  exit 1
else
  echo "LFS Chapter 8 IANA ETC Complete"
  sleep 3
fi

/bin/bash CH08.03-glibc.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.03-glibc.sh"
  exit 1
else
  echo "LFS Chapter 8 GlibC Complete"
  sleep 3
fi

/bin/bash CH08.04-zlib.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.04-zlib.sh"
  exit 1
else
  echo "LFS Chapter 8 Zlib Complete"
  sleep 3
fi

/bin/bash CH08.05-bzip2.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.05-bzip2.sh"
  exit 1
else
  echo "LFS Chapter 8 Bzip2 Complete"
  sleep 3
fi

/bin/bash CH08.06-xz.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.06-xz.sh"
  exit 1
else
  echo "LFS Chapter 8 XZ Complete"
  sleep 3
fi

/bin/bash CH08.07-lz4.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.07-lz4.sh"
  exit 1
else
  echo "LFS Chapter 8 LZ4 Complete"
  sleep 3
fi

/bin/bash CH08.08-zstd.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.08-zstd.sh"
  exit 1
else
  echo "LFS Chapter 8 ZSTD Complete"
  sleep 3
fi

/bin/bash CH08.09-file.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.09-file.sh"
  exit 1
else
  echo "LFS Chapter 8 File Complete"
  sleep 3
fi

/bin/bash CH08.10-readline.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.10-readline.sh"
  exit 1
else
  echo "LFS Chapter 8 Readline Complete"
  sleep 3
fi

/bin/bash CH08.11-m4.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.11-m4.sh"
  exit 1
else
  echo "LFS Chapter 8 M4 Complete"
  sleep 3
fi

/bin/bash CH08.12-bc.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.12-bc.sh"
  exit 1
else
  echo "LFS Chapter 8 BC Complete"
  sleep 3
fi

/bin/bash CH08.13-flex.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.13-flex.sh"
  exit 1
else
  echo "LFS Chapter 8 Flex Complete"
  sleep 3
fi

/bin/bash CH08.14-tcl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.14-tcl.sh"
  exit 1
else
  echo "LFS Chapter 8 Tcl Complete"
  sleep 3
fi

/bin/bash CH08.15-expect.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.15-expect.sh"
  exit 1
else
  echo "LFS Chapter 8 Expect Complete"
  sleep 3
fi

/bin/bash CH08.16-dejagnu.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.16-dejagnu.sh"
  exit 1
else
  echo "LFS Chapter 8 DejaGNU Complete"
  sleep 3
fi

/bin/bash CH08.17-pkgconf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.17-pkgconf.sh"
  exit 1
else
  echo "LFS Chapter 8 Pkgconf Complete"
  sleep 3
fi

/bin/bash CH08.18-binutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.18-binutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Binutils Complete"
  sleep 3
fi

/bin/bash CH08.19-gmp.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.19-gmp.sh"
  exit 1
else
  echo "LFS Chapter 8 GMP Complete"
  sleep 3
fi

/bin/bash CH08.20-mpfr.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.20-mpfr.sh"
  exit 1
else
  echo "LFS Chapter 8 MPFR Complete"
  sleep 3
fi

/bin/bash CH08.21-mpc.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.21-mpc.sh"
  exit 1
else
  echo "LFS Chapter 8 MPC Complete"
  sleep 3
fi

/bin/bash CH08.22-attr.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.22-attr.sh"
  exit 1
else
  echo "LFS Chapter 8 Attr Complete"
  sleep 3
fi

/bin/bash CH08.23-acl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.23-acl.sh"
  exit 1
else
  echo "LFS Chapter 8 ACL Complete"
  sleep 3
fi

/bin/bash CH08.24-libcap.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.24-libcap.sh"
  exit 1
else
  echo "LFS Chapter 8 Libcap Complete"
  sleep 3
fi

/bin/bash CH08.25-libxcrypt.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.25-libxcrypt.sh"
  exit 1
else
  echo "LFS Chapter 8 Libxcrypt Complete"
  sleep 3
fi

/bin/bash BLFS.01-cracklib.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.01-cracklib.sh"
  exit 1
else
  echo "BLFS Cracklib Complete"
  sleep 3
fi

/bin/bash CH08.26-shadow.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.26-shadow.sh"
  exit 1
else
  echo "LFS Chapter 8 Shadow Complete"
  sleep 3
fi

/bin/bash CH08.27-gcc.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.27-gcc.sh"
  exit 1
else
  echo "LFS Chapter 8 GCC Complete"
  sleep 60
fi

/bin/bash CH08.28-ncurses.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.28-ncurses.sh"
  exit 1
else
  echo "LFS Chapter 8 Ncurses Complete"
  sleep 3
fi

/bin/bash CH08.29-sed.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.29-sed.sh"
  exit 1
else
  echo "LFS Chapter 8 Sed Complete"
  sleep 3
fi

/bin/bash CH08.30-psmisc.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.30-psmisc.sh"
  exit 1
else
  echo "LFS Chapter 8 Psmisc Complete"
  sleep 3
fi

/bin/bash CH08.31-gettext.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.31-gettext"
  exit 1
else
  echo "LFS Chapter 8 Gettext Complete"
  sleep 3
fi

/bin/bash CH08.32-bison.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.32-bison"
  exit 1
else
  echo "LFS Chapter 8 Bison Complete"
  sleep 3
fi

/bin/bash CH08.33-grep.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.33-grep"
  exit 1
else
  echo "LFS Chapter 8 Grep Complete"
  sleep 3
fi

/bin/bash CH08.34-bash.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.34-bash"
  exit 1
else
  echo "LFS Chapter 8 Bash Complete"
  sleep 3
fi


echo "You should set the r00t password now."
echo
echo "Also, Exit chroot and re-enter to invoke new bash"

exit 0
