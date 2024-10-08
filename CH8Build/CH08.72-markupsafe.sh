#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d MarkupSafe-${markupsafe_version} ] && rm -rf MarkupSafe-${markupsafe_version}

tar -zxf ${markupsafe_tarball}

cd MarkupSafe-${markupsafe_version}

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
if [ $? -ne 0 ]; then
  myfail "Failed building MarkupSafe"
fi

pip3 install --no-index --no-user --find-links dist Markupsafe
if [ $? -ne 0 ]; then
  myfail "Failed installing MarkupSafe"
fi

popd

# cleanup

pushd $GLSOURCES 

rm -rf MarkupSafe-${markupsafe_version}

popd
