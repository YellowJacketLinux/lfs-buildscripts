#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d make-ca-${makeca_version} ] && rm -rf make-ca-${makeca_version}

tar -zxf ${makeca_tarball}

cd make-ca-${makeca_version}

patch -p1 < ../make-ca-${makeca_version}-libressl.patch

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing make-ca"
fi

# initial certificate bundles
cp ../certdata-dist.txt /etc/ssl/certdata.txt
/usr/sbin/make-ca -r

# auto-update via systemd
systemctl enable update-pki.timer

# configure pip3
[ ! -d /etc/profile.d ] && mkdir -p /etc/profile.d

cat > /etc/profile.d/pythoncerts.sh << "EOF"
# Begin /etc/profile.d/pythoncerts.sh

export _PIP_STANDALONE_CERT=/etc/pki/tls/certs/ca-bundle.crt

# End /etc/profile.d/pythoncerts.sh
EOF

popd

# cleanup

pushd $GLSOURCES 

rm -rf make-ca-${makeca_version}

popd
