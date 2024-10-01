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
