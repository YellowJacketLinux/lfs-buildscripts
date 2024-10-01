LFS SystemD Build Scripts
=========================
Shell scripts for building LFS SystemD

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
