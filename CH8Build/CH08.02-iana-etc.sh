#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d iana-etc-${man_pages_version} ] && rm -rf iana-etc-${man_pages_version}

tar -zxf ${iana_etc_tarball}

cd iana-etc-${man_pages_version}

cp services protocols /etc


