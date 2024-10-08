#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d grub-${grub_version} ] && rm -rf grub-${grub_version}

tar -Jxf ${grub_tarball}

cd grub-${grub_version}

unset {C,CPP,CXX,LD}FLAGS
echo depends bli part_gpt > grub-core/extra_deps.lst

./configure --prefix=/usr \
  --sysconfdir=/etc \
  --disable-efiemu \
  --disable-werror

make
if [ $? -ne 0 ]; then
  myfail "Failed building grub"
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing grub"
fi
mv /etc/bash_completion.d/grub /usr/share/bash-completion/completions

popd

# cleanup

pushd $GLSOURCES 

rm -rf grub-${grub_version}

popd
