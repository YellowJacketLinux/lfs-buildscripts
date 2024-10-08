#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d Python-${python_version} ] && rm -rf Python-${python_version}

tar -Jxf ${python_tarball}

cd Python-${python_version}

LDFLAGS="${LDFLAGS} -Wl,-rpath=/opt/openssl/lib" \
./configure --prefix=/usr \
            --enable-shared \
            --with-openssl=/opt/openssl \
            --with-system-expat \
            --enable-optimizations

make
if [ $? -ne 0 ]; then
  myfail "Failed building Python"
fi

echo "running Python make test. Could be time consuming."
make test TESTOPTS="--timeout 120" > ${GLSOURCES}/python.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing Python"
fi

# this will not be used for RPM packaging

cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

install -dm755 /usr/share/doc/python-${python_version}/html

tar --no-same-owner \
    -xvf ../python-${python_version}-docs-html.tar.bz2
cp -R --no-preserve=mode python-${python_version}-docs-html/* \
    /usr/share/doc/python-${python_version}/html

popd

# cleanup

pushd $GLSOURCES 

rm -rf Python-${python_version}

popd
