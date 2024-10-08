#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d meson-${meson_version} ] && rm -rf meson-${meson_version}

tar -zxf ${meson_tarball}

cd meson-${meson_version}

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
if [ $? -ne 0 ]; then
  myfail "Failed building meson"
fi

pip3 install --no-index --find-links dist meson
if [ $? -ne 0 ]; then
  myfail "Failed installing meson"
fi

install -Dm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -Dm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson

popd

# cleanup

pushd $GLSOURCES 

rm -rf meson-${meson_version}

popd
