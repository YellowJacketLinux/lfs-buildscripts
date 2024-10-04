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

exit 0
