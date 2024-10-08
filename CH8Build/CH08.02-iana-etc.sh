#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d iana-etc-${iana_etc_version} ] && rm -rf iana-etc-${iana_etc_version}

tar -zxf ${iana_etc_tarball}

cd iana-etc-${iana_etc_version}

cp services protocols /etc

popd

# cleanup

pushd $GLSOURCES 

rm -rf iana-etc-${iana_etc_version}

popd
