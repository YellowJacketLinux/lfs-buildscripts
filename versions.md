The versions.sh Script
======================

This build of LFS 12.2 has some differences in from ‘The Book’. These
differences are mostly academic in nature.

One issue I have with the LFS book is that it uses MD5 hashes to verify the
source tarball. MD5 is no longer suitable for that purpose and has not been
suitable for that purpose for quite some time now.

MD5 hashes do validate that the downloaded file was not corrupted during the
file retrieval but they do not validate that the file on the server has not
been tampered with.

The `versions.sh` script here specifies the SHA256 hash of the upstream source
file so that in addition to verifying that the download is not corrupt, the
upstream file has not been tampered with.

Granted, a GPG signature is needed to be completely confident, but unless the
attacker has modified the SHA256 checksum within the `versions.sh` script, the
checksum in the script can be used to validate the upstream package.
