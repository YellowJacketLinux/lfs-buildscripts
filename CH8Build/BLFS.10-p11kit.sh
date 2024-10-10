#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d p11-kit-${p11kit_version} ] && rm -rf p11-kit-${p11kit_version}

tar -Jxf ${p11kit_tarball}

cd p11-kit-${p11kit_version}

sed '20,$ d' -i trust/trust-extract-compat

cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF

mkdir p11-build && cd p11-build

meson setup .. \
  --prefix=/usr \
  --buildtype=release \
  -D trust_paths=/etc/pki/anchors

ninja
if [ $? -ne 0 ]; then
  myfail "Failed building p11-kit"
fi

ninja install
if [ $? -ne 0 ]; then
  myfail "Failed installing p11-kit"
fi

ln -sf /usr/libexec/p11-kit/trust-extract-compat /usr/bin/update-ca-certificates

ln -sf ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so

popd

# cleanup

pushd $GLSOURCES 

rm -rf p11-kit-${p11kit_version}

popd
