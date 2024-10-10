#!/bin/bash

# compiles the system software
FULLSET="90"

/bin/bash CH08.35-libtool.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.35-libtool.sh"
  exit 1
else
  echo "LFS Chapter 8 Libtool complete [36/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.36-gdbm.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.36-gdbm.sh"
  exit 1
else
  echo "LFS Chapter 8 GDBM complete [37/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.37-gperf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.37-gperf.sh"
  exit 1
else
  echo "LFS Chapter 8 Gperf complete [38/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.38-expat.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.38-expat.sh"
  exit 1
else
  echo "LFS Chapter 8 Expat complete [39/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.39-inetutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.39-inetutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Inetutils Complete [40/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.40-less.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.40-less.sh"
  exit 1
else
  echo "LFS Chapter 8 Less Complete [41/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.41-perl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.41-perl.sh"
  exit 1
else
  echo "LFS Chapter 8 Perl Complete [42/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.42-xml-parser.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.42-xml-parser.sh"
  exit 1
else
  echo "LFS Chapter 8 XML::Parser Complete [43/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.43-Intltool.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.43-intltool.sh"
  exit 1
else
  echo "LFS Chapter 8 Intltool Complete [44/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.44-autoconf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.44-autoconf.sh"
  exit 1
else
  echo "LFS Chapter 8 Autoconf Complete [45/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.45-automake.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.45-automake.sh"
  exit 1
else
  echo "LFS Chapter 8 Automake Complete [46/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.46-libressl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.46-libressl.sh"
  exit 1
else
  echo "LFS Chapter 8 LibreSSL (OpenSSL) Complete [47/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.47-kmod.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.47-kmod.sh"
  exit 1
else
  echo "LFS Chapter 8 Kmod Complete [48/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.48-libelf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.48-libelf.sh"
  exit 1
else
  echo "LFS Chapter 8 Libelf Complete [49/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.49-libffi.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.49-libffi.sh"
  exit 1
else
  echo "LFS Chapter 8 Libffi Complete [50/${FULLSET}]"
  sleep 3
fi

# Disable LibreSSL
pushd /usr/include
mv openssl dis-openssl
popd
pushd /usr/lib/pkgconfig
mv libssl.pc dis-libssl.pc
popd

/bin/bash CH08.49b-openssl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.49b-openssl.sh"
  exit 1
else
  echo "LFS Chapter 8 OpenSSL Complete [51/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.50-python.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.50-python.sh"
  exit 1
else
  echo "LFS Chapter 8 Python Complete [52/${FULLSET}]"
  sleep 3
fi

# re-enable LibreSSL
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
  echo "LFS Chapter 8 Flit-Core Complete [53/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.52-wheel.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.52-wheel.sh"
  exit 1
else
  echo "LFS Chapter 8 Wheel Complete [54/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.53-setuptools.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.53-setuptools.sh"
  exit 1
else
  echo "LFS Chapter 8 Setuptools Complete [55/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.54-ninja.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.54-ninja.sh"
  exit 1
else
  echo "LFS Chapter 8 Ninja Complete [56/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.55-meson.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.55-ninja.sh"
  exit 1
else
  echo "LFS Chapter 8 Meson Complete [57/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.56-coreutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.56-coreutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Coreutils Complete [58/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.57-check.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.57-check.sh"
  exit 1
else
  echo "LFS Chapter 8 Check Complete [59/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.58-diffutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.58-diffutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Diffutils Complete [60/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.59-gawk.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.59-gawk.sh"
  exit 1
else
  echo "LFS Chapter 8 Gawk Complete [61/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.60-findutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.60-findutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Findutils Complete [62/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.61-groff.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.61-groff.sh"
  exit 1
else
  echo "LFS Chapter 8 Groff Complete [63/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.62-grub.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.62-grub.sh"
  exit 1
else
  echo "LFS Chapter 8 Grub Complete [64/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.63-gzip.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.63-gzip.sh"
  exit 1
else
  echo "LFS Chapter 8 Gzip Complete [65/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.64-iproute2.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.64-iproute2.sh"
  exit 1
else
  echo "LFS Chapter 8 IPRoute2 Complete [66/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.65-kbd.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.65-kbd.sh"
  exit 1
else
  echo "LFS Chapter 8 Kbd Complete [67/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.66-libpipeline.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.66-libpipeline.sh"
  exit 1
else
  echo "LFS Chapter 8 Libpipeline Complete [68/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.67-make.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.67-make.sh"
  exit 1
else
  echo "LFS Chapter 8 Make Complete [69/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.68-patch.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.68-patch.sh"
  exit 1
else
  echo "LFS Chapter 8 Patch Complete [70/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.69-tar.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.69-tar.sh"
  exit 1
else
  echo "LFS Chapter 8 Tar Complete [71/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.70-texinfo.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.70-texinfo.sh"
  exit 1
else
  echo "LFS Chapter 8 Texinfo Complete [72/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.71-vim.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.71-vim.sh"
  exit 1
else
  echo "LFS Chapter 8 Vim Complete [73/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.72-markupsafe.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.72-markupsafe.sh"
  exit 1
else
  echo "LFS Chapter 8 MarkupSafe Complete [74/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.73-jinja2.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.73-jinja2.sh"
  exit 1
else
  echo "LFS Chapter 8 Jinja2 Complete [75/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.74-systemd.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.74-systemd.sh"
  exit 1
else
  echo "LFS Chapter 8 SystemD Complete [76/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.75-dbus.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.75-dbus.sh"
  exit 1
else
  echo "LFS Chapter 8 D-Bus Complete [77/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.76-mandb.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.76-mandb.sh"
  exit 1
else
  echo "LFS Chapter 8 Man-DB Complete [78/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.77-procps-ng.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.77-procps-ng.sh"
  exit 1
else
  echo "LFS Chapter 8 Procps-ng Complete [79/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.78-util-linux.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.78-util-linux.sh"
  exit 1
else
  echo "LFS Chapter 8 Util-linux Complete [80/${FULLSET}]"
  sleep 3
fi

/bin/bash CH08.79-e2fsprogs.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.79-e2fsprogs.sh"
  exit 1
else
  echo "LFS Chapter 8 E2fsprogs Complete [81/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.02-systemd-units.sh

/bin/bash BLFS.03-gpm.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.03-gpm.sh"
  exit 1
else
  echo "BLFS GPM Daemon Install Complete [82/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.04-libunistring.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.04-libunistring.sh"
  exit 1
else
  echo "BLFS Libunistring Install Complete [83/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.05-libidn2.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.05-libidn2.sh"
  exit 1
else
  echo "BLFS Libisn2 Install Complete [84/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.06-libpsl.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.06-libpsl.sh"
  exit 1
else
  echo "BLFS Libpsl Install Complete [85/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.07-wget.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.07-wget.sh"
  exit 1
else
  echo "BLFS Wget Install Complete [86/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.08-curl.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.08-curl.sh"
  exit 1
else
  echo "BLFS cURL Install Complete [87/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.09-libtasn1.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.09-libtasn1.sh"
  exit 1
else
  echo "BLFS Libtasn1 Install Complete [88/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.10-p11kit.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.10-p11kit.sh"
  exit 1
else
  echo "BLFS p11-kit Install Complete [89/${FULLSET}]"
  sleep 3
fi

/bin/bash BLFS.11-make-ca.sh

if [ $? -ne 0 ]; then
  echo "failed BLFS.11-make-ca.sh"
  exit 1
else
  echo "BLFS make-ca Install Complete [90/${FULLSET}]"
  sleep 3
fi

#stripping

/bin/bash CH08.80-stripping.sh > /dev/null 2>&1

#cleanup

rm -rf /tmp/{*,.*}
find /usr/lib /usr/libexec -name \*.la -delete
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf
userdel -r tester







exit 0
