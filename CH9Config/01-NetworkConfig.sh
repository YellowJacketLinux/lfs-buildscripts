#!/bin/bash

function myfail {
  echo "$1"
  exit 1
}

if [ "`whoami`" != "root" ]; then
  myfail "Must run this script as r00t"
fi

cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4
::1       localhost localhost.localdomain localhost6 localhost6.localdomain6

# End /etc/hosts
EOF

# do not use systemd-resolved for now
systemctl disable systemd-resolved
cat > /etc/resolv.conf << "EOF"
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

if [ ! -f /USBFlash ]; then
  # final system config
  echo "localhost" > /etc/hostname
  cat > /etc/systemd/network/10-lan0.link << "EOF"
[Match]
MACAddress=0c:c4:7a:c8:a5:4c

[Link]
NAME=lan0
EOF
  cat > /etc/systemd/network/10-lan0.network << "EOF"
[Match]
Name=lan0

[Network]
DHCP=ipv4
EOF
  # auto-update certificate bundle
  systemctl enable update-pki.timer
else
  # bootable USB thumb drive
  echo "lfsusb" > /etc/hostname
  systemctl disable systemd-networkd-wait-online
fi
