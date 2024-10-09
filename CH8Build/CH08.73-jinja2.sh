#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d jinja2-${jinja2_version} ] && rm -rf jinja2-${jinja2_version}

tar -zxf ${jinja2_tarball}

cd jinja2-${jinja2_version}

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
if [ $? -ne 0 ]; then
  myfail "Failed building jinja2"
fi

pip3 install --no-index --no-user --find-links dist Jinja2
if [ $? -ne 0 ]; then
  myfail "Failed installing jinja2"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf jinja2-${jinja2_version}

popd
