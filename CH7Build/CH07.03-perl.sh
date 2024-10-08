#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d perl-${perl_version} ] && rm -rf perl-${perl_version}

tar -Jxf ${perl_tarball}

cd perl-${perl_version}

vlib="/usr/lib/perl${perl_major_version}/${perl_major_version}.${perl_minor_version}"

sh Configure -des \
  -D prefix=/usr \
  -D vendorprefix=/usr \
  -D useshrplib \
  -D privlib=${vlib}/core_perl \
  -D archlib=${vlib}/core_perl \
  -D sitelib=${vlib}/site_perl \
  -D sitearch=${vlib}/site_perl \
  -D vendorlib=${vlib}/vendor_perl \
  -D vendorarch=${vlib}/vendor_perl

make

if [ $? -ne 0 ]; then
  myfail "Failed building perl"
fi

make install

if [ $? -ne 0 ]; then
  myfail "Failed installing perl"
fi

popd

# cleanup

pushd ${GLSOURCES}

rm -rf perl-${perl_version}

popd
