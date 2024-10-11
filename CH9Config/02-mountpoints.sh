#!/bin/bash

function myfail {
  echo "$1"
  exit 1
}

if [ "`whoami`" != "root" ]; then
  myfail "Must run this script as r00t"
fi

if [ ! -f /USBFlash ]; then
  # final system config
  cat > /etc/fstab << "EOF"
# UUID/File System                        mount-point    type     options          dump fsck
#                                                                                    order

UUID=ed56dd97-52b1-4efb-8f2c-b83dee11ad74 /              ext4     defaults,noatime    1 1
UUID=2322f8e6-1d3d-43ee-becf-67417a46e124 /boot          ext2     defaults            1 2
#UUID=5f6d2023-bea1-48af-9486-c5afe0f7b9c7 /home          ext4     defaults            1 2
UUID=a36492d9-de00-4c51-9649-cd5b5004f790 swap           swap     defaults            0 0
EOF
else
  cat > /etc/fstab << "EOF"
  # When the USBFlash boots
  cat > /etc/fstab << "EOF"
# UUID/File System                        mount-point    type     options          dump fsck
#                                                                                    order

UUID=?? / ext4 defaults,noatime 1 1
UUID=ed56dd97-52b1-4efb-8f2c-b83dee11ad74 /mnt/newlfs    ext4     defaults,noatime    1 2
UUID=2322f8e6-1d3d-43ee-becf-67417a46e124 /mnt/newlfs/boot ext2   defaults,noauto     1 2
UUID=a36492d9-de00-4c51-9649-cd5b5004f790 swap           swap     defaults            0 0
EOF
fi
