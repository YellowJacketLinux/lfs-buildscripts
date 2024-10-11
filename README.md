LFS SystemD Build Scripts
=========================
Shell scripts for building LFS SystemD

Based upon https://www.linuxfromscratch.org/lfs/view/stable-systemd/
version 12.2

This set of scripts does not use `fdisk` or `mke2fs`, those need to be run and
formatted for the appropriate partitions before starting. With caution of
course.

Do not yet use

This git repository contains shell scripts needed to build LFS 12.2-systemd and
is being worked on in an `x86_64` LFS 11.3 (modified) system.

There are some deviations from LFS 12.2, namely:

* LibreSSL is used instead of OpenSSL *except* with Python3
* LTS Kernel series 6.6.x is being used in place of 6.10.x kernel series
* Some versions are updated from what is in the LFS book.

The host I am building from is an LFS 11.3 system with similar modifications.

When LFS 12.2 is built on the USB Thumb Drive, it should then be possible to
boot from the USB Thumb Drive and run the scripts again to build LFS 12.2 from
LFS 12.2 on a hard disk partition where I can then proceed with the other steps
in `THE_PLAN.md` towards creating a RPM distro from scratch.

As of present, these scripts are not complete and some are probably broken.

These instructions are not complete notes.

If you run the script `version-check.sh` (copy-pasta straight from the LFS
book) and everything on your build system passes, there is a *good chance*
these scripts can build LFS 12.2 on your build system. If anything on your
build system does __not__ pass the tests in that scripts, there is a good
chance your build system is not suitable. Sometimes you can upgrade some
components, but it is smoother to start with a system already capable.


Chapter 03 ‘Get Sources’ Script
-------------------------------

This script is to be run by the `lfs` user. The partition LFS is to be built on
must already be mounted at `/mnt/newlfs` and the directory `/mnt/newlfs/sources`
should exist and be owned by the `lfs` user.

The script will download the needed sources (sourcing `versions.sh`) and make a
backup of the downloaded sources so that if run again, it can get the sources
from the backup and not need to download them again.

The file `versions.sh` also includes `sha256sum` digests so that the script can
verify the integrity of the fetched files.


Chapter 05 Building
-------------------

In the `CH5Build` directory, the `lfs` user should execute the `Master.sh`
script:

    lfs$ bash Master.sh

The script works but is not finished. To do, it needs to verify the system is
ready for the script to run. The `Master.sh` script calls the `CH05.*` scripts.


Chapter 06 Building
-------------------

In the `CH6Build` directory, the `lfs` user should execute the `Master.sh`
script:

    lfs$ bash Master.sh

The script works but is not finished. To do, it needs to verify the system is
ready for the script to run. The `Master.sh` script calls the `CH06.*` scripts.


Chapter 07 Building
-------------------

__PAY ATTENTION__: First, the `root` user must execute the `CHROOT.sh` script:

    root# bash CHROOT.sh

That script will copy `CH7Build` and `CH8Build` into `/mnt/newlfs/sources` and
then fix some permissions and set up `/mnt/newlfs` for the `chroot`
environment.

Finally, it echoes the command that the `root` user must execute to enter the
`chroot` environment.

Once in the `chroot`:

    root# cd /sources/CH7Build
    root# bash 0-CH07-Prep.sh

After executing `0-CH07-Prep.sh` reload `bash` with the following:

    root# exec /usr/bin/bash --login

Then, still inside the `chroot` at `/sources/CH7Build`, execute:

    root# bash Master.sh

The script works but is not finished. To do, it needs to verify the system is
ready for the script to run. The `Master.sh` script calls the `CH07.*` scripts.

Some important build tools previously built in the host environment will be
rebuilt within the `chroot` environment. After the script runs, it will echo
instructions on how to back things up. The backup takes a few minutes but it
saves time if something goes wrong in Chapter 8 building.


Chapter 08 Building
-------------------

__PAY ATTENTION__: After running the build scripts for LFS Chapter 7, the
instructions for creating the backup involved deleted the `/mnt/newlfs/sources`
directory.

As the `lfs` user, re-run the `CH03-get-sources.sh` script to restore the
sources:

    lfs$ bash CH03-get-sources.sh

The script will restore the sources from the backup it made the first time it
ran, it will not need to fetch them again.

Then as the `root` user, once again execute the `CHROOT.sh` script to set up
the `chroot` environment and copy the build scripts into it:

    root# bash CHROOT.sh

Again, the script will echo the command to enter the `chroot`. Execute it as
`root` and then once in the `chroot` environment:

    root# cd /sources/CH8Build
    root# bash Master.sh

That will run many of the `CH08.*` scripts, building the LFS system through
`CH08.34-bash`. Note that when it builds the `shadow` package, it first builds
the `cracklib` package from BLFS and then links `shadow` against it. It does
not however build PAM.

After it finishes building `bash`, the `Master.sh` script will instruct you to
set the `root` password. After doing so, exit the `chroot` and re-enter so that
the freshly rebuilt `bash` will be loaded.

Once in the `chroot` environment again:

    root# cd /sources/CH8Build
    root# bash Master2.sh

That will run the rest of the `CH08.*` scripts. Assuming all goes well, the
system will be ready for LFS Chapter 9 configuration.

It also builds several packages from BLFS, specifically enough so that `wget`
and `curl` are built, along with the TLS certificate bundles needed for those
tools to make TLS (HTTPS) connections.

Note that `Master2.sh` does have a major deviation from the LFS book. It builds
LibreSSL to provide the OpenSSL API (e.g. as used by the `kmod` package). Most
software that builds against OpenSSL will build against LibreSSL and I have
more trust in the LibreSSL developers.

As of Python 3.10, Python 3 no longer allows building against LibreSSL. So
OpenSSL is still built, the `_ssl` and `_hashlib` Python modules need it and
are pretty important to a sane Python environment.

See the file `TLS-README.md` for more information.

The `CH08.*` scripts seem to work but I need to audit them against the LFS book
and some of them are missing the running of the tests. Also, I need to add a
way to disable the running of the tests.


Chapter Nine Configuration
--------------------------

These configuration scripts have things very specific to my hardware, such as
the MAC Address of my NIC and the UUID identifiers for my disk partitions.

### Network Configuration

For the network configuration, I am trying to use `systemd-networkd` to
configure the network interface card, I think I understand the documentation
for that and the general impression I get is that it works quite well.

For DNS resolution however, I found the documentation for `systemd-resolved` to
be quite confusing and I also found many complaints from Ubuntu and Fedora
users seeming to indicate it is still quite buggy.

So the script for setting up networking disables `systemd-resolved` and instead
creates a classic `/etc/resolv.conf` file. Once I have the system running, I
will likely play with `systemd-resolved` and figure things out. For the desktop
user, it seems like the biggest advantages of `systemd-resolved` over the
simpler `/etc/resolv.conf` are the ability to endorce DNSSEC and the ability to
use DNS over TLS (different than DNS over HTTPS) *however* it seems both of
those features are marked as *experimental*. For the present, users who want
DNSSEC should probably run `unbound` on the localhost for DNS services. That is
what I personally do.

DoT does have some privacy benefits but honestly I am not that fond of it, I do
not think the extra complexity and added points of failure are of a real world
benefit. DoT does not prevent the DNS server itself from tracking your requests
or selling data about you. DoT does protect against DNS injection attacks *but
only between you and the recursive resolver*. It does not provide end to end
injection protection between you and the authoritative DNS server. Recursive
resolvers __should__ opportunisticly use DoT when communicating with
authoritative servers (or upstream recursive resolvers) but they should only use
opportunistic DoT as otherwise, a TLS issue could cause a large service outage
that potentially impacts life-saving emergency services.

I am not convinced that the added complexity of DoT is proper for the desktop
user. Users who *want* to run it though should be able to, and
`systemd-resolved` potentially allows them to.

DNSSEC is the only way you can verify the response to your DNS request has not
been tampered with, and DNSSEC *should* be implemented on each client machine.
That is a definite benefit to `systemd-resolved` or at least will be once it is
working properly and no longer marked as *experimental*.

For the small business or larger home, a couple (never only one) of ‘Raspberry
Pi’ devices running `unbound` is a very good thing. The `unbound` caching DNS
server should be running opportunistic DoT of course but the desktop machines
that query them really do not need to.

Medium and larger businesses may need something more powerful than a ‘Raspberry
Pi’ device, but they should have IT departments with people trained to figure out
what they need. Point is, DoT really is not a desktop user technology IMHO.

DNS over HTTPS is a browser technology and IMHO is rubbish, the only real
benefit is to trackers because it prevents DNS based advertisement and tracker
blocking and thus DoH actually serves to __reduce end-user privacy__. Turn it off
in your browser, some browsers now *cough*FireFox*cough* enable it by default.

Okay back on topic...

Network configuration for the USB flash drive is to simply not use it, it does
not need a network connection for anything, it will have all the source tarballs
it needs to rebuild LFS on the target hard drive.

### /etc/fstab

Note that for the generation of the `/etc/fstab` files, I am using the partion
`UUID`. That is a deviation from the LFS book but it is a more reliable way to
identify the partition to be mounted.

For the `/etc/fstab` that will be used when built to the hard disk, the `/home`
partition is commented out. My `/home` is actually shared between several
different installs and distributions, so once I actually boot into the system
and add the user accounts with their proper user and group ID, then I can
uncomment that entry and reboot.

For the `/etc/fstab` that will be used when built to the USB thumb drive, at
boot it will mount the partition of the hard drive I plan to install to at
`/mnt/newlfs` so that it is ready to go.

There is an `fstab` entry for `/mnt/newlfs/boot` but it does not mount that
filesystem automatically. That is also the `/boot` for my LFS 11.3 install
and it will not be mounted until I am ready to build the kernel that will be
installed to it, so the entry is there to make it easy to mount when I need
to mount it but it will not actually be mounted until just before the kernel
is compiled.

The `/etc/fstab` entry for the root filesystem on the USB flash drive still
needs to be filled in, I have not formatted the drive yet, I am still doing
dry runs.

