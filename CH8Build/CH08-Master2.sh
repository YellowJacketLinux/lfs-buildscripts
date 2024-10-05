#!/bin/bash

# compiles the system software

/bin/bash CH08.35-libtool.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.35-libtool.sh"
  exit 1
else
  echo "LFS Chapter 8 Libtool complete"
  sleep 3
fi

/bin/bash CH08.36-gdbm.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.36-gdbm.sh"
  exit 1
else
  echo "LFS Chapter 8 GDBM complete"
  sleep 3
fi

/bin/bash CH08.37-gperf.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.37-gperf.sh"
  exit 1
else
  echo "LFS Chapter 8 Gperf complete"
  sleep 3
fi

/bin/bash CH08.38-expat.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.38-expat.sh"
  exit 1
else
  echo "LFS Chapter 8 Expat complete"
  sleep 3
fi

/bin/bash CH08.39-inetutils.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.39-inetutils.sh"
  exit 1
else
  echo "LFS Chapter 8 Inetutils Complete"
  sleep 3
fi

/bin/bash CH08.40-less.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.40-less.sh"
  exit 1
else
  echo "LFS Chapter 8 Less Complete"
  sleep 3
fi

/bin/bash CH08.41-perl.sh

if [ $? -ne 0 ]; then
  echo "failed CH08.41-perl.sh"
  exit 1
else
  echo "LFS Chapter 8 Perl Complete"
  sleep 3
fi










exit 0
