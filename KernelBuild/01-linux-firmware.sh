#!/bin/bash

source versions.sh

GLSOURCES="/sources"

pushd ${GLSOURCES} > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -d linux-firmware-${linux_firmware_version} ] \
  && rm -rf linux-firmware-${linux_firmware_version}

tar -zxf ${linux_firmware_tarball}

echo "Installing firmware blobs"

mv linux-firmware-${linux_firmware_version} /lib/firmware

popd
