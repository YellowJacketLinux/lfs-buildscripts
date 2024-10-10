TLS Implementation
==================

LFS and most of the GNU/Linux world primarily uses OpenSSL for TLS. This is
one place where I am deviating, sort of.

With Yellow-Jacket GNU/Linux my preference is to use GnuTLS for the TLS stack
wherever possible and use LibreSSL to provide the OpenSSL API for software that
requires the OpenSSL API. That frequently but not always works.

It is possible to have both LibreSSL and OpenSSL installed at the same time.
This can be done two ways:

1. Use different install prefixes for both.
2. Use the same install prefix but with care to avoid file name conflicts.

Method 2 is the superior method but requires package management because when
using that method, the developer files for both can not be installed at the same
time.

LFS itself only needs the OpenSSL API for __kmod__ and for __Python__. You can
actually build Python without the OpenSSL API but two python modules that are
considered critical do not get built.

Unfortunately as of Python 3.10 the Python developers no longer support the
LibreSSL implementation of the OpenSSL API. This may be why the existing
GNU/Linux distributions that were using LibreSSL stopped doing so.

My preferred solution would be to patch Python to use LibreSSL however I do not
have the coding skill to do that myself nor the financial resources to pay
someone who does. So Python will be built against OpenSSL even though other
software that requires the OpenSSL API will be built against LibreSSL.

To do this while building the LFS system, OpenSSL is built and installed using
a prefix of `/opt/openssl` and then when building Python, Python is told where
to find it and to use `rpath` for the library.

That is not ideal, but without package management, it is the simplest solution.

Once the RPM package manager has been built, both LibreSSL and OpenSSL can be
built as RPM packages using an install prefix of `/usr` with their shared
libraries installed in `/usr/lib` and shared libraries for both can be installed
at the same time as the file names do not conflict.

Then when the Python RPM is built, the development package for OpenSSL will be
installed in the build environment, allowing Python to link against OpenSSL.
Other packages that need the OpenSSL API and can be built against LibreSSL will
be built with the LibreSSL development package installed.

Hopefully in the future, a quality patch that allows current versions of Python3
to build against LibreSSL for the critical `_ssl` and `_hashlib` modules will be
maintained but until then, YJL can still use LibreSSL for *most* OpenSSL API
needs and use OpenSSL exclusively for Python3.


LibreSSL Build Notes
--------------------

The build of LibreSSL itself is patched to use `libressl.cnf` instead of
`openssl.cnf` for the OpenSSL configuration file, and the binary is
installed as `libressl` instead of as `openssl`.

Doing so will allow those who want the *actual* `openssl` binary to have it
without the binary or configuration file conflicting with the LibreSSL fork.

For those who do not need the *actual* `openssl` binary, symbolic links allow
the traditional configuration file and binary name to still be used.


Certificate Bundle Notes
------------------------

Most GNU/Linux distributions package TLS certificate bundles for the users.

The BLFS developers maintain a tool called `make-ca` which generates the TLS
certificate bundles on the user’s system and quite frankly, that is a superior
method as it allows end users who need to do so to customize the certificate
bundles.

Their tool makes use of `/usr/bin/openssl` and when I first installed LFS 11.3
using LibreSSL instead of OpenSSL, I found that the tool ‘mostly’ worked but not
completely.

Generation of the certificate bundles worked perfectly, what did not work was
the retrievel of the `certdata.txt` file.

The `make-ca` utility uses `/usr/bin/openssl s_client` to retrieve the file with
hard-coded certificate information for `hg.mozilla.org`. Either LibreSSL does
not support the options to `openssl s_client` that were used, or the hard-coded
certificate was no longer valid.

What I found was that if I instead used `/usr/bin/curl` to retrieve the
`certdata.txt` file when an update was available, it worked, as long as there
already was valid certificate bundle for `curl` to validate the connection
against.

So long story short, I patched `make-ca` to use `/usr/bin/libressl` for
everything *except* the retrieval of a new `certdata.txt` file. For that, I
patched it to use `/usr/bin/curl`.

The initial `certdata.txt` file is installed from elsewhere (not retrieved via
the `make-ca` file) and then the certificate bundles are generated from it
using `make-ca -r`. This then results in a valid certificate bundle that `curl`
can use to grab an updated `certdata.txt` file when a new version is published.

In this git repo, the file `CH8Build/certdata-dist.txt` is installed as the
initial `certdata.txt` file and is the same file that unpatched `make-ca` would
grab with OpenSSL.

This method also allows generation of the initial certificate bundles even from
within the `chroot` being used to build the LFS system before the system has
ever booted so that the certificate bundles are there even on the very first
boot, allowing both `wget` and `curl` to work properly with TLS connections.
