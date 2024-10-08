#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gettext-${gettext_version} ] && rm -rf gettext-${gettext_version}

tar -Jxf ${gettext_tarball}

cd gettext-${gettext_version}

./configure --disable-shared

make

if [ $? -ne 0 ]; then
  myfail "Failed building gettext"
fi

cp gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

popd

# cleanup

pushd ${GLSOURCES}

rm -rf gettext-${gettext_version}

popd

