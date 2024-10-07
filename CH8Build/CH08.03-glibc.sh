#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d glibc-${glibc_version} ] && rm -rf glibc-${glibc_version}

tar -Jxf ${glibc_tarball}

cd glibc-${glibc_version}

patch -Np1 -i ../${glibc_patch_file}

mkdir build && cd build
echo "rootsbindir=/usr/sbin" > configparms

../configure --prefix=/usr \
             --disable-werror \
             --enable-kernel=4.19 \
             --enable-stack-protector=strong \
             --disable-nscd \
             libc_cv_slibdir=/usr/lib

make

if [ $? -ne 0 ]; then
  myfail "Failed building glibc"
fi

# temporarily disable
#echo "running glibc make check, could take awhile..."
#make check > ${GLSOURCES}/glibc.check.log 2>&1

touch /etc/ld.so.conf

sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile


make install

if [ $? -ne 0 ]; then
  myfail "Failed installing glibc"
fi

sed '/RTLDLIST=/s@/usr@@g' -i /usr/bin/ldd

make localedata/install-locales

localedef -i C -f UTF-8 C.UTF-8
localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true

cat > /etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files systemd
group: files systemd
shadow: files systemd

hosts: mymachines resolve [!UNAVAIL=return] files myhostname dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

tar -zxf ../../${tzdata_tarball}

ZONEINFO=/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right}

for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward; do
    zic -L /dev/null   -d $ZONEINFO       ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix ${tz}
    zic -L leapseconds -d $ZONEINFO/right ${tz}
done

cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO

cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF
mkdir -pv /etc/ld.so.conf.d

# end glibc
