#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d vim-${vim_version} ] && rm -rf vim-${vim_version}

tar -zxf ${vim_tarball}

cd vim-${vim_version}

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make
if [ $? -ne 0 ]; then
  myfail "Failed building vim"
fi

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running vim make test"
  chown -R tester .
  su tester -c "TERM=xterm-256color LANG=en_US.UTF-8 make -j1 test" \
    &> vim.test.log
  mv vim.test.log ${GLSOURCES}/
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing vim"
fi

ln -s vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -s vim.1 $(dirname $L)/vi.1
done

ln -s ../vim/vim91/doc /usr/share/doc/vim-${vim_version}

cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

popd

# cleanup

pushd $GLSOURCES 

rm -rf vim-${vim_version}

popd
