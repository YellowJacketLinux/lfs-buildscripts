#!/bin/bash

# compiles the system software

/bin/bash CH08.35-libtool.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.35-libtool.sh"
  exit 1
else
  echo "LFS Chapter 8 Libtool complete [36/81]"
  sleep 3
fi

/bin/bash CH08.36-gdbm.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.36-gdbm.sh"
  exit 1
else
  echo "LFS Chapter 8 GDBM complete [37/81]"
  sleep 3
fi

/bin/bash CH08.37-gperf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.37-gperf.sh"
  exit 1
else
  echo "LFS Chapter 8 Gperf complete [38/81]"
  sleep 3
fi

/bin/bash CH08.38-expat.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.38-expat.sh"
  exit 1
else
  echo "LFS Chapter 8 Expat complete [39/81]"
  sleep 3
fi

/bin/bash CH08.39-inetutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.39-inetutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Inetutils Complete [40/81]"
  sleep 3
fi

/bin/bash CH08.40-less.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.40-less.sh"
  exit 1
else
  echo "LFS Chapter 8 Less Complete [41/81]"
  sleep 3
fi

/bin/bash CH08.41-perl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.41-perl.sh"
  exit 1
else
  echo "LFS Chapter 8 Perl Complete [42/81]"
  sleep 3
fi

/bin/bash CH08.42-xml-parser.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.42-xml-parser.sh"
  exit 1
else
  echo "LFS Chapter 8 XML::Parser Complete [43/81]"
  sleep 3
fi

/bin/bash CH08.43-Intltool.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.43-intltool.sh"
  exit 1
else
  echo "LFS Chapter 8 Intltool Complete [44/81]"
  sleep 3
fi

/bin/bash CH08.44-autoconf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.44-autoconf.sh"
  exit 1
else
  echo "LFS Chapter 8 Autoconf Complete [45/81]"
  sleep 3
fi

/bin/bash CH08.45-automake.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.45-automake.sh"
  exit 1
else
  echo "LFS Chapter 8 Automake Complete [46/81]"
  sleep 3
fi

/bin/bash CH08.46-libressl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.46-libressl.sh"
  exit 1
else
  echo "LFS Chapter 8 LibreSSL (OpenSSL) Complete [47/81]"
  sleep 3
fi

/bin/bash CH08.47-kmod.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.47-kmod.sh"
  exit 1
else
  echo "LFS Chapter 8 Kmod Complete [48/81]"
  sleep 3
fi

/bin/bash CH08.48-libelf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.48-libelf.sh"
  exit 1
else
  echo "LFS Chapter 8 Libelf Complete [49/81]"
  sleep 3
fi

/bin/bash CH08.49-libffi.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.49-libffi.sh"
  exit 1
else
  echo "LFS Chapter 8 Libffi Complete [50/81]"
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
  echo "LFS Chapter 8 OpenSSL Complete [51/81]"
  sleep 3
fi

/bin/bash CH08.50-python.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.50-python.sh"
  exit 1
else
  echo "LFS Chapter 8 Python Complete [52/81]"
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
  echo "LFS Chapter 8 Flit-Core Complete [53/81]"
  sleep 3
fi

/bin/bash CH08.52-wheel.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.52-wheel.sh"
  exit 1
else
  echo "LFS Chapter 8 Wheel Complete [54/81]"
  sleep 3
fi

/bin/bash CH08.53-setuptools.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.53-setuptools.sh"
  exit 1
else
  echo "LFS Chapter 8 Setuptools Complete [55/81]"
  sleep 3
fi

/bin/bash CH08.54-ninja.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.54-ninja.sh"
  exit 1
else
  echo "LFS Chapter 8 Ninja Complete [56/81]"
  sleep 3
fi

/bin/bash CH08.55-meson.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.55-ninja.sh"
  exit 1
else
  echo "LFS Chapter 8 Meson Complete [57/81]"
  sleep 3
fi

/bin/bash CH08.56-coreutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.56-coreutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Coreutils Complete [58/81]"
  sleep 3
fi

/bin/bash CH08.57-check.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.57-check.sh"
  exit 1
else
  echo "LFS Chapter 8 Check Complete [59/81]"
  sleep 3
fi

/bin/bash CH08.58-diffutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.58-diffutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Diffutils Complete [60/81]"
  sleep 3
fi

/bin/bash CH08.59-gawk.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.59-gawk.sh"
  exit 1
else
  echo "LFS Chapter 8 Gawk Complete [61/81]"
  sleep 3
fi

/bin/bash CH08.60-findutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.60-findutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Findutils Complete [62/81]"
  sleep 3
fi

/bin/bash CH08.61-groff.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.61-groff.sh"
  exit 1
else
  echo "LFS Chapter 8 Groff Complete [63/81]"
  sleep 3
fi

/bin/bash CH08.62-grub.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.62-grub.sh"
  exit 1
else
  echo "LFS Chapter 8 Grub Complete [64/81]"
  sleep 3
fi

/bin/bash CH08.63-gzip.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.63-gzip.sh"
  exit 1
else
  echo "LFS Chapter 8 Gzip Complete [65/81]"
  sleep 3
fi

/bin/bash CH08.64-iproute2.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.64-iproute2.sh"
  exit 1
else
  echo "LFS Chapter 8 IPRoute2 Complete [66/81]"
  sleep 3
fi

/bin/bash CH08.65-kbd.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.65-kbd.sh"
  exit 1
else
  echo "LFS Chapter 8 Kbd Complete [67/81]"
  sleep 3
fi

/bin/bash CH08.66-libpipeline.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.66-libpipeline.sh"
  exit 1
else
  echo "LFS Chapter 8 Libpipeline Complete [68/81]"
  sleep 3
fi

/bin/bash CH08.67-make.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.67-make.sh"
  exit 1
else
  echo "LFS Chapter 8 Make Complete [69/81]"
  sleep 3
fi

/bin/bash CH08.68-patch.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.68-patch.sh"
  exit 1
else
  echo "LFS Chapter 8 Patch Complete [70/81]"
  sleep 3
fi

/bin/bash CH08.69-tar.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.69-tar.sh"
  exit 1
else
  echo "LFS Chapter 8 Tar Complete [71/81]"
  sleep 3
fi

/bin/bash CH08.70-texinfo.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.70-texinfo.sh"
  exit 1
else
  echo "LFS Chapter 8 Texinfo Complete [72/81]"
  sleep 3
fi

/bin/bash CH08.71-vim.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.71-vim.sh"
  exit 1
else
  echo "LFS Chapter 8 Vim Complete [73/81]"
  sleep 3
fi

/bin/bash CH08.72-markupsafe.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.72-markupsafe.sh"
  exit 1
else
  echo "LFS Chapter 8 MarkupSafe Complete [74/81]"
  sleep 3
fi

/bin/bash CH08.73-jinja2.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.73-jinja2.sh"
  exit 1
else
  echo "LFS Chapter 8 Jinja2 Complete [75/81]"
  sleep 3
fi

/bin/bash CH08.74-systemd.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.74-systemd.sh"
  exit 1
else
  echo "LFS Chapter 8 SystemD Complete [76/81]"
  sleep 3
fi

/bin/bash CH08.75-dbus.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.75-dbus.sh"
  exit 1
else
  echo "LFS Chapter 8 D-Bus Complete [77/81]"
  sleep 3
fi

/bin/bash CH08.76-mandb.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.76-mandb.sh"
  exit 1
else
  echo "LFS Chapter 8 Man-DB Complete [78/81]"
  sleep 3
fi

/bin/bash CH08.77-procps-ng.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.77-procps-ng.sh"
  exit 1
else
  echo "LFS Chapter 8 Procps-ng Complete [79/91]"
  sleep 3
fi

/bin/bash CH08.78-util-linux.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.78-util-linux.sh"
  exit 1
else
  echo "LFS Chapter 8 Util-linux Complete [80/81]"
  sleep 3
fi

/bin/bash CH08.79-e2fsprogs.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.79-e2fsprogs.sh"
  exit 1
else
  echo "LFS Chapter 8 E2fsprogs Complete [81/81]"
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
