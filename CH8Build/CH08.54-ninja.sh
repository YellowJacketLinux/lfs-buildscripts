#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d ninja-${ninja_version} ] && rm -rf ninja-${ninja_version}

tar -zxf ${ninja_tarball}

cd ninja-${ninja_version}

sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc 

python3 configure.py --bootstrap
if [ $? -ne 0 ]; then
  myfail "Failed building ninja"
fi

install -m755 ninja /usr/bin/
install -Dm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -Dm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

popd

# cleanup

pushd $GLSOURCES 

rm -rf ninja-${ninja_version}

popd
