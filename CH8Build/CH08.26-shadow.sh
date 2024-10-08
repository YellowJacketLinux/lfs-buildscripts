#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d shadow-${shadow_version} ] && rm -rf shadow-${shadow_version}

tar -Jxf ${shadow_tarball}

cd shadow-${shadow_version}

# for libcrack
sed -i 's@DICTPATH.*@DICTPATH\t/lib/cracklib/pw_dict@' etc/login.defs

sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD YESCRYPT:' \
    -e 's:/var/spool/mail:/var/mail:'                   \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                  \
    -i etc/login.defs


#sed -i 's:DICTPATH.*:DICTPATH\t/lib/cracklib/pw_dict:' etc/login.defs


touch /usr/bin/passwd
./configure --sysconfdir=/etc   \
            --disable-static    \
            --with-{b,yes}crypt \
            --without-libbsd    \
            --with-group-name-max-length=32 \
            --with-libcrack


make
if [ $? -ne 0 ]; then
  myfail "Failed building shadow"
fi

make exec_prefix=/usr pamdir= install
if [ $? -ne 0 ]; then
  myfail "Failed installing shadow"
fi
make -C man install-man

pwconv
grpconv

mkdir -p /etc/default
useradd -D --gid 999

popd

# cleanup

pushd $GLSOURCES 

rm -rf shadow-${shadow_version}

popd
