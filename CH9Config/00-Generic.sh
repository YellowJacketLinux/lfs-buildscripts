#!/bin/bash

# hostname

echo "localhost" > /etc/hostname

# system locale

echo FONT=Lat2-Terminus16 > /etc/vconsole.conf

cat > /etc/locale.conf << "EOF"
LANG="en_US.UTF-8"
EOF

# /etc/profile

cat > /etc/profile << "EOF"
# Begin /etc/profile

for i in $(locale); do
  unset ${i%=*}
done

if [[ "$TERM" = linux ]]; then
  export LANG=C.UTF-8
else
  source /etc/locale.conf

  for i in $(locale); do
    key=${i%=*}
    if [[ -v $key ]]; then
      export $key
    fi
  done
fi

# End /etc/profile
EOF

# /etc/inputrc

cat > /etc/inputrc << "EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8-bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

# /etc/shells

cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF

# modprobe.d

install -m755 -d /etc/modprobe.d

cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/blacklist.conf

blacklist nouveau
options nouveau modset=0

# End /etc/modprobe.d/blacklist.conf
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="12.2-systemd"
ID=lfs
PRETTY_NAME="Linux From Scratch 12.2-systemd"
VERSION_CODENAME="Genesis Insanity"
HOME_URL="https://www.linuxfromscratch.org/lfs/"
EOF

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="12.2-systemd"
DISTRIB_CODENAME="YJL Genesis"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

echo 12.2-systemd > /etc/lfs-release
