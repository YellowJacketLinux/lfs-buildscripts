#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d XML-Parser-${xml_parser_version} ] && rm -rf XML-Parser-${xml_parser_version}

tar -zxf ${xml_parser_tarball}

cd XML-Parser-${xml_parser_version}

perl Makefile.PL

make
if [ $? -ne 0 ]; then
  myfail "Failed building XML Parser"
fi

echo "running XML Parser make test"
make test > ${GLSOURCES}/XML-Parser.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing XML-Parser"
fi

