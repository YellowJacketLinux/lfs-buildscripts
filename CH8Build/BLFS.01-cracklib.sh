#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d cracklib-${cracklib_version} ] && rm -rf cracklib-${cracklib_version}

tar -Jxf ${cracklib_tarball}

cd cracklib-${cracklib_version}

./configure --prefix=/usr \
  --disable-static \
  --with-default-dict=/usr/lib/cracklib/pw_dict

make
if [ $? -ne 0 ]; then
  myfail "Failed building cracklib"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing cracklib"
fi

install -v -m644 -D    ../cracklib-words-2.10.2.xz \
  /usr/share/dict/cracklib-words.xz

unxz -v                  /usr/share/dict/cracklib-words.xz
ln -v -sf cracklib-words /usr/share/dict/words

echo $(hostname) >>      /usr/share/dict/cracklib-extra-words

install -v -m755 -d      /usr/lib/cracklib

create-cracklib-dict     /usr/share/dict/cracklib-words \
                         /usr/share/dict/cracklib-extra-words

popd

# cleanup

pushd $GLSOURCES 

rm -rf cracklib-${cracklib_version}

popd
