#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d gcc-${gcc_version} ] && rm -rf gcc-${gcc_version}

tar -Jxf ${gcc_tarball}

cd gcc-${gcc_version}

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir build && cd build

../configure --prefix=/usr \
            LD=ld \
            --enable-languages=c,c++ \
            --enable-default-pie     \
            --enable-default-ssp     \
            --enable-host-pie        \
            --disable-multilib       \
            --disable-bootstrap      \
            --disable-fixincludes    \
            --with-system-zlib

make
if [ $? -ne 0 ]; then
  myfail "Failed building gcc"
fi

ulimit -s -H unlimited

sed -e '/cpython/d'               -i ../gcc/testsuite/gcc.dg/plugin/plugin.exp
sed -e 's/no-pic /&-no-pie /'     -i ../gcc/testsuite/gcc.target/i386/pr113689-1.c
sed -e 's/300000/(1|300000)/'     -i ../libgomp/testsuite/libgomp.c-c++-common/pr109062.c
sed -e 's/{ target nonpic } //' \
    -e '/GOTPCREL/d'              -i ../gcc/testsuite/gcc.target/i386/fentryname3.c

if [ ! -f ${GLSOURCES}/SKIPTESTS ]; then
  echo "running gcc make check. This takes a VERY long time."
  echo "You can watch progress in another console via:"
  echo "    tail -f /mnt/newlfs/sources/gcc-${gcc_version}/build/gcc.check.log"
  chown -R tester .
  su tester -c "PATH=$PATH make -k check > gcc.check.log"
  mv gcc.check.log ${GLSOURCES}/
fi

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing gcc"
fi

chown -v -R root:root \
    /usr/lib/gcc/$(gcc -dumpmachine)/14.2.0/include{,-fixed}

ln -svr /usr/bin/cpp /usr/lib
ln -sv gcc.1 /usr/share/man/man1/cc.1

ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/14.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/

popd

# cleanup

pushd $GLSOURCES 

rm -rf gcc-${gcc_version}

popd
