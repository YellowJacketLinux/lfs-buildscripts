#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d man-pages-${man_pages_version} ] && rm -rf man-pages-${man_pages_version}

tar -Jxf ${man_pages_tarball}

cd man-pages-${man_pages_version}

rm -f man3/crypt*

make prefix=/usr install

if [ $? -ne 0 ]; then
  myfail "Failed installing man-pages"
fi
