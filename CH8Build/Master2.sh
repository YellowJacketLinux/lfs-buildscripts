#!/bin/bash

# compiles the system software

/bin/bash CH08.35-libtool.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.35-libtool.sh"
  exit 1
else
  echo "LFS Chapter 8 Libtool complete"
  sleep 3
fi

/bin/bash CH08.36-gdbm.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.36-gdbm.sh"
  exit 1
else
  echo "LFS Chapter 8 GDBM complete"
  sleep 3
fi

/bin/bash CH08.37-gperf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.37-gperf.sh"
  exit 1
else
  echo "LFS Chapter 8 Gperf complete"
  sleep 3
fi

/bin/bash CH08.38-expat.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.38-expat.sh"
  exit 1
else
  echo "LFS Chapter 8 Expat complete"
  sleep 3
fi

/bin/bash CH08.39-inetutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.39-inetutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Inetutils Complete"
  sleep 3
fi

/bin/bash CH08.40-less.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.40-less.sh"
  exit 1
else
  echo "LFS Chapter 8 Less Complete"
  sleep 3
fi

/bin/bash CH08.41-perl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.41-perl.sh"
  exit 1
else
  echo "LFS Chapter 8 Perl Complete"
  sleep 3
fi

/bin/bash CH08.42-xml-parser.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.42-xml-parser.sh"
  exit 1
else
  echo "LFS Chapter 8 XML::Parser Complete"
  sleep 3
fi

/bin/bash CH08.43-Intltool.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.43-intltool.sh"
  exit 1
else
  echo "LFS Chapter 8 Intltool Complete"
  sleep 3
fi

/bin/bash CH08.44-autoconf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.44-autoconf.sh"
  exit 1
else
  echo "LFS Chapter 8 Autoconf Complete"
  sleep 3
fi

/bin/bash CH08.45-automake.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.45-automake.sh"
  exit 1
else
  echo "LFS Chapter 8 Automake Complete"
  sleep 3
fi

/bin/bash CH08.46-libressl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.46-libressl.sh"
  exit 1
else
  echo "LFS Chapter 8 LibreSSL (OpenSSL) Complete"
  sleep 3
fi

/bin/bash CH08.47-kmod.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.47-kmod.sh"
  exit 1
else
  echo "LFS Chapter 8 Kmod Complete"
  sleep 3
fi

/bin/bash CH08.48-libelf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.48-libelf.sh"
  exit 1
else
  echo "LFS Chapter 8 Libelf Complete"
  sleep 3
fi

/bin/bash CH08.49-libffi.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.49-libffi.sh"
  exit 1
else
  echo "LFS Chapter 8 Libffi Complete"
  sleep 3
fi

# Disable OpenSSL
pushd /usr/include
mv openssl dis-openssl
popd
pushd /usr/lib/pkgconfig
mv libssl.pc dis-libssl.pc
popd

/bin/bash CH08.50-python.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.50-python.sh"
  exit 1
else
  echo "LFS Chapter 8 Python Complete"
  sleep 3
fi

# re-enable OpenSSL
pushd /usr/include
mv dis-openssl openssl
popd
pushd /usr/lib/pkgconfig
mv dis-libssl.pc libssl.pc
popd

/bin/bash CH08.51-flit-core.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.51-flit-core.sh"
  exit 1
else
  echo "LFS Chapter 8 Flit-Core Complete"
  sleep 3
fi

/bin/bash CH08.52-wheel.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.52-wheel.sh"
  exit 1
else
  echo "LFS Chapter 8 Wheel Complete"
  sleep 3
fi

/bin/bash CH08.53-setuptools.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.53-setuptools.sh"
  exit 1
else
  echo "LFS Chapter 8 Setuptools Complete"
  sleep 3
fi

/bin/bash CH08.54-ninja.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.54-ninja.sh"
  exit 1
else
  echo "LFS Chapter 8 Ninja Complete"
  sleep 3
fi

/bin/bash CH08.55-meson.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.55-ninja.sh"
  exit 1
else
  echo "LFS Chapter 8 Meson Complete"
  sleep 3
fi

/bin/bash CH08.56-coreutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.56-coreutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Coreutils Complete"
  sleep 3
fi








exit 0
