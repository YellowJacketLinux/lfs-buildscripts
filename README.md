LFS SystemD Build Scripts
=========================
Shell scripts for building LFS SystemD

Based upon https://www.linuxfromscratch.org/lfs/view/stable-systemd/
version 12.2

Do not yet use

This git repository contains shell scripts needed to build LFS 12.2-systemd and
is being worked on in an `x86_64` LFS 11.3 (modified) system.

There are some deviations from LFS 12.2, namely:

* LibreSSL is used instead of OpenSSL
* LTS Kernel series 6.6 is being used in place of 6.10.x kernel series
* Python 3.12.6 is being used in place of Python 3.12.5
* setuptools 75.1.0 is being used in place of setuptools 72.2.0

The LFS host is an LFS 11.3 system with similar modifications.

As of present, these scripts are not complete and probably broken.


The Madness
-----------

Long term goal is to produce a GNU/Linux distribution largely based upon LFS
but using RPM packages with a ‘core’ package repository and then additional
package repositories that require the ‘core’ package repository.

Multilib is not a goal, nor is compatibility with WINE. The goal is to allow
‘Free Libre Open Source Software’ to have a capable GNU system running the
Linux kernel upon which to run.

I *personally* will be involved in the package repository for the MATE Desktop
Environment when it gets that far, but as far as GNOME, KDE, etc. if they are
to have package repositories then others will have to provide them.

What I want is a stable ‘LTS’ distribution along the lines of what CentOS used
to be but third-party package repositories providing for the needs of the user
community, similar to how ‘Fedora Extras’ supplemented Red Hat Linux back in the
day.

Is that too much to ask?


The Plan
--------

These scripts will be used to build a bootable USB thumb drive that will then
be used to run the scripts again to rebuild itself on the hard disk. The thumb
drive then becomes my emergency boot device.

Once installed on the hard drive, BLFS packages will be added until I have a
basic usable system bootstrapped with the RPM package manager.

At that point, packages will be added until I am able to run the XFCE desktop
environment. Long-term goal personally is MATE but MATE will be done as a
separate package repository. Hopefully KDE and GNOME will also be done as
separate package repositories as well.

Users who are happy with XFCE will not need a separate package repository for
their desktop environment.

Back on topic, once XFCE is properly packaged and working, then the scripts
used to build the bootable USB thumb drive will be used to build an installer
thumb drive with a crude basic installer to create a system using RPM packages.

That will be the first release of ‘Yellow-Jacket GNU/Linux’ and it is probable
that by the time that happens, the LTS kernel will have changed and quite
likely other core components like GCC and GlibC and Python.


