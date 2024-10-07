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
a prefix of '/opt/openssl' and then when building Python, Python is told where
to find it and to use __rpath__ for the library.

That is not ideal, but without package management, it is the simplest solution.

Once the RPM package manager has been built, both LibreSSL and OpenSSL can be
built as RPM packages using an install prefix of '/usr' with their shared
libraries installed in '/usr/lib' and shared libraries for both can be installed
at the same time as the file names do not conflict.

Then when the Python RPM is built, the development package for OpenSSL will be
installed in the build environment, allowing Python to link against OpenSSL.
Other packages that need the OpenSSL API and can be built against LibreSSL will
be built with the LibreSSL development package installed.

Hopefully in the future, a quality patch that allows current versions of Python3
to build against LibreSSL for the critical '_ssl' and '_hashlib' modules will be
maintained but until then, YJL can still use LibreSSL for *most* OpenSSL API
needs and use OpenSSL exclusively for Python3.
