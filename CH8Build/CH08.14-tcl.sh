#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d tcl${tcl_version} ] && rm -rf tcl${tcl_version}

tar -zxf ${tcl_tarball}

cd tcl${tcl_version}

SCRDIR=$(pwd)
cd unix

./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --disable-rpath

make
if [ $? -ne 0 ]; then
  myfail "Failed building tcl"
fi

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.7|/usr/lib/tdbc1.1.7|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.7/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.7/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.7|/usr/include|"            \
    -i pkgs/tdbc1.1.7/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.4|/usr/lib/itcl4.2.4|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.4/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.2.4|/usr/include|"            \
    -i pkgs/itcl4.2.4/itclConfig.sh

unset SRCDIR

echo "running tcl make test"
make test > ${GLSOURCES}/tcl.check 2>&1

make install
if [ $? -ne 0 ]; then
  myfail "Failed installing tcl"
fi

chmod -v u+w /usr/lib/libtcl8.6.so

make install-private-headers

ln -sfv tclsh8.6 /usr/bin/tclsh

mv /usr/share/man/man3/{Thread,Tcl_Thread}.3

cd ..
tar -xf ../tcl${tcl_version}-html.tar.gz --strip-components=1
mkdir -v -p /usr/share/doc/tcl-${tcl_version}
cp -v -r  ./html/* /usr/share/doc/tcl-${tcl_version}

popd

# cleanup

pushd $GLSOURCES 

rm -rf tcl${tcl_version}

popd
