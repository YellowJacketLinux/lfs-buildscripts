#!/bin/bash

source versions.sh

GLSOURCES="/sources"

[ ! -d /usr/local/src ] && mkdir -p /usr/local/src

pushd /usr/local/src
tar -Jxf ${GLSOURCES}/${systemd_units_tarball}
popd

