#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d perl-${perl_version} ] && rm -rf perl-${perl_version}

tar -Jxf ${perl_tarball}

cd perl-${perl_version}

export BUILD_ZLIB=False
export BUILD_BZIP2=0

# may be defined via the RPM

export MY_PERL_VERSION="${perl_major_version}.${perl_minor_version}"

sh Configure -des                                                        \
             -D prefix=/usr                                              \
             -D vendorprefix=/usr                                        \
             -D privlib=/usr/lib/perl5/${MY_PERL_VERSION}/core_perl      \
             -D archlib=/usr/lib/perl5/${MY_PERL_VERSION}/core_perl      \
             -D sitelib=/usr/lib/perl5/${MY_PERL_VERSION}/site_perl      \
             -D sitearch=/usr/lib/perl5/${MY_PERL_VERSION}/site_perl     \
             -D vendorlib=/usr/lib/perl5/${MY_PERL_VERSION}/vendor_perl  \
             -D vendorarch=/usr/lib/perl5/${MY_PERL_VERSION}/vendor_perl \
             -D man1dir=/usr/share/man/man1                              \
             -D man3dir=/usr/share/man/man3                              \
             -D pager="/usr/bin/less -isR"                               \
             -D useshrplib                                               \
             -D usethreads

make
if [ $? -ne 0 ]; then
  myfail "Failed building perl"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running perl make test"
  TEST_JOBS=$(nproc) make test_harness > ${GLSOURCES}/perl.check.log 2>&1
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing perl"
fi

unset BUILD_ZLIB BUILD_BZIP2 MY_PERL_VERSION

popd

# cleanup

pushd $GLSOURCES 

rm -rf perl-${perl_version}

popd
