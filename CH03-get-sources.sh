#!/bin/bash

LFS=/mnt/newlfs

source versions.sh

GLSOURCES="${LFS}/sources"
CWD="`pwd`"

[ ! -d ${GLSOURCES} ] && mkdir ${GLSOURCES}

function getSource {
  URL="`echo $1 |xargs`"
  EXPECTED="`echo $2 |xargs`"
  FILE="`echo $3 |xargs`"

  echo "Retrieving ${FILE}"

  tries=0
  while [ ${tries} -lt 4 ]; do
    if [ ! -f ${FILE} ]; then
      wget ${URL}
    fi
    CHECK="`sha256sum ${FILE} |awk ' { print $1 } ' `"
    if [ "${CHECK}" == "${EXPECTED}" ]; then
      return
    else
      rm -f ${FILE}
      sleep 3
    fi
    tries=$(expr ${tries} + 1) 
  done
  myfail "failed to retrieve ${URL}"
}

pushd $GLSOURCES > /dev/null 2>&1 || myfail "Failed to move to ${GLSOURCES}"

[ -f ${HOME}/lfs-sources.tar ] && tar -xpf ${HOME}/lfs-sources.tar

getSource "${acl_dnl}" "${acl_sha256}" "${acl_tarball}"
getSource "${attr_dnl}" "${attr_sha256}" "${attr_tarball}"
getSource "${autoconf_dnl}" "${autoconf_sha256}" "${autoconf_tarball}"
getSource "${automake_dnl}" "${automake_sha256}" "${automake_tarball}"
getSource "${bash_dnl}" "${bash_sha256}" "${bash_tarball}"
getSource "${bc_dnl}" "${bc_sha256}" "${bc_tarball}"
getSource "${binutils_dnl}" "${binutils_sha256}" "${binutils_tarball}"
getSource "${bison_dnl}" "${bison_sha256}" "${bison_tarball}"
getSource "${bzip2_dnl}" "${bzip2_sha256}" "${bzip2_tarball}"
getSource "${bzip2_patch_dnl}" "${bzip2_patch_sha256}" "${bzip2_patch_file}"
getSource "${check_dnl}" "${check_sha256}" "${check_tarball}"
getSource "${coreutils_dnl}" "${coreutils_sha256}" "${coreutils_tarball}"
getSource "${coreutils_patch_dnl}" "${coreutils_patch_sha256}" "${coreutils_patch_file}"
getSource "${cracklib_dnl}" "${cracklib_sha256}" "${cracklib_tarball}"
getSource "${cracklib_words_english_dnl}" "${cracklib_words_english_sha256}" "${cracklib_words_english_tarball}"
getSource "${curl_dnl}" "${curl_sha256}" "${curl_tarball}"
getSource "${dbus_dnl}" "${dbus_sha256}" "${dbus_tarball}"
getSource "${dejagnu_dnl}" "${dejagnu_sha256}" "${dejagnu_tarball}"
getSource "${diffutils_dnl}" "${diffutils_sha256}" "${diffutils_tarball}"
getSource "${e2fsprogs_dnl}" "${e2fsprogs_sha256}" "${e2fsprogs_tarball}"
getSource "${elfutils_dnl}" "${elfutils_sha256}" "${elfutils_tarball}"
getSource "${expat_dnl}" "${expat_sha256}" "${expat_tarball}"
getSource "${expect_dnl}" "${expect_sha256}" "${expect_tarball}"
getSource "${expect_patch_dnl}" "${expect_patch_sha256}" "${expect_patch_file}"
getSource "${file_dnl}" "${file_sha256}" "${file_tarball}"
getSource "${findutils_dnl}" "${findutils_sha256}" "${findutils_tarball}"
getSource "${flex_dnl}" "${flex_sha256}" "${flex_tarball}"
getSource "${flit_core_dnl}" "${flit_core_sha256}" "${flit_core_tarball}"
getSource "${gawk_dnl}" "${gawk_sha256}" "${gawk_tarball}"
getSource "${gcc_dnl}" "${gcc_sha256}" "${gcc_tarball}"
getSource "${gdbm_dnl}" "${gdbm_sha256}" "${gdbm_tarball}"
getSource "${gettext_dnl}" "${gettext_sha256}" "${gettext_tarball}"
getSource "${glibc_dnl}" "${glibc_sha256}" "${glibc_tarball}"
getSource "${glibc_patch_dnl}" "${glibc_patch_sha256}" "${glibc_patch_file}"
getSource "${gmp_dnl}" "${gmp_sha256}" "${gmp_tarball}"
getSource "${gperf_dnl}" "${gperf_sha256}" "${gperf_tarball}"
getSource "${gpm_dnl}" "${gpm_sha256}" "${gpm_tarball}"
getSource "${gpm_patch_dnl}" "${gpm_patch_sha256}" "${gpm_patch_file}"
getSource "${grep_dnl}" "${grep_sha256}" "${grep_tarball}"
getSource "${groff_dnl}" "${groff_sha256}" "${groff_tarball}"
getSource "${grub_dnl}" "${grub_sha256}" "${grub_tarball}"
getSource "${gzip_dnl}" "${gzip_sha256}" "${gzip_tarball}"
getSource "${iana_etc_dnl}" "${iana_etc_sha256}" "${iana_etc_tarball}"
getSource "${inetutils_dnl}" "${inetutils_sha256}" "${inetutils_tarball}"
getSource "${intltool_dnl}" "${intltool_sha256}" "${intltool_tarball}"
getSource "${iproute2_dnl}" "${iproute2_sha256}" "${iproute2_tarball}"
getSource "${jinja2_dnl}" "${jinja2_sha256}" "${jinja2_tarball}"
getSource "${kbd_dnl}" "${kbd_sha256}" "${kbd_tarball}"
getSource "${kbd_patch_dnl}" "${kbd_patch_sha256}" "${kbd_patch_file}"
getSource "${kmod_dnl}" "${kmod_sha256}" "${kmod_tarball}"
getSource "${less_dnl}" "${less_sha256}" "${less_tarball}"
getSource "${libcap_dnl}" "${libcap_sha256}" "${libcap_tarball}"
getSource "${libffi_dnl}" "${libffi_sha256}" "${libffi_tarball}"
getSource "${libidn2_dnl}" "${libidn2_sha256}" "${libidn2_tarball}"
getSource "${libpipeline_dnl}" "${libpipeline_sha256}" "${libpipeline_tarball}"
getSource "${libpsl_dnl}" "${libpsl_sha256}" "${libpsl_tarball}"
getSource "${libressl_dnl}" "${libressl_sha256}" "${libressl_tarball}"
getSource "${libtasn1_dnl}" "${libtasn1_sha256}" "${libtasn1_tarball}"
getSource "${libtool_dnl}" "${libtool_sha256}" "${libtool_tarball}"
getSource "${libunistring_dnl}" "${libunistring_sha256}" "${libunistring_tarball}"
getSource "${libxcrypt_dnl}" "${libxcrypt_sha256}" "${libxcrypt_tarball}"
getSource "${linux_lts_dnl}" "${linux_lts_sha256}" "${linux_lts_tarball}"
getSource "${lz4_dnl}" "${lz4_sha256}" "${lz4_tarball}"
getSource "${m4_dnl}" "${m4_sha256}" "${m4_tarball}"
getSource "${make_dnl}" "${make_sha256}" "${make_tarball}"
getSource "${makeca_dnl}" "${makeca_sha256}" "${makeca_tarball}"
getSource "${mandb_dnl}" "${mandb_sha256}" "${mandb_tarball}"
getSource "${man_pages_dnl}" "${man_pages_sha256}" "${man_pages_tarball}"
getSource "${markupsafe_dnl}" "${markupsafe_sha256}" "${markupsafe_tarball}"
getSource "${meson_dnl}" "${meson_sha256}" "${meson_tarball}"
getSource "${mpc_dnl}" "${mpc_sha256}" "${mpc_tarball}"
getSource "${mpfr_dnl}" "${mpfr_sha256}" "${mpfr_tarball}"
getSource "${ncurses_dnl}" "${ncurses_sha256}" "${ncurses_tarball}"
getSource "${ninja_dnl}" "${ninja_sha256}" "${ninja_tarball}"
getSource "${openssl_dnl}" "${openssl_sha256}" "${openssl_tarball}"
getSource "${p11kit_dnl}" "${p11kit_sha256}" "${p11kit_tarball}"
getSource "${patch_dnl}" "${patch_sha256}" "${patch_tarball}"
getSource "${perl_dnl}" "${perl_sha256}" "${perl_tarball}"
getSource "${pkgconf_dnl}" "${pkgconf_sha256}" "${pkgconf_tarball}"
getSource "${procps_dnl}" "${procps_sha256}" "${procps_tarball}"
getSource "${psmisc_dnl}" "${psmisc_sha256}" "${psmisc_tarball}"
getSource "${python_dnl}" "${python_sha256}" "${python_tarball}"
getSource "${pythondoc_dnl}" "${pythondoc_sha256}" "${pythondoc_tarball}"
getSource "${readline_dnl}" "${readline_sha256}" "${readline_tarball}"
getSource "${sed_dnl}" "${sed_sha256}" "${sed_tarball}"
getSource "${setuptools_dnl}" "${setuptools_sha256}" "${setuptools_tarball}"
getSource "${shadow_dnl}" "${shadow_sha256}" "${shadow_tarball}"
getSource "${systemd_dnl}" "${systemd_sha256}" "${systemd_tarball}"
getSource "${systemd_man_dnl}" "${systemd_man_sha256}" "${systemd_man_tarball}"
getSource "${systemd_units_dnl}" "${systemd_units_sha256}" "${systemd_units_tarball}"
getSource "${tar_dnl}" "${tar_sha256}" "${tar_tarball}"
getSource "${tcl_dnl}" "${tcl_sha256}" "${tcl_tarball}"
getSource "${tcl_doc_dnl}" "${tcl_doc_sha256}" "${tcl_doc_tarball}"
getSource "${texinfo_dnl}" "${texinfo_sha256}" "${texinfo_tarball}"
getSource "${tzdata_dnl}" "${tzdata_sha256}" "${tzdata_tarball}"
getSource "${util_linux_dnl}" "${util_linux_sha256}" "${util_linux_tarball}"
getSource "${vim_dnl}" "${vim_sha256}" "${vim_tarball}"
getSource "${wget_dnl}" "${wget_sha256}" "${wget_tarball}"
getSource "${wheel_dnl}" "${wheel_sha256}" "${wheel_tarball}"
getSource "${xml_parser_dnl}" "${xml_parser_sha256}" "${xml_parser_tarball}"
getSource "${xz_dnl}" "${xz_sha256}" "${xz_tarball}"
getSource "${zlib_dnl}" "${zlib_sha256}" "${zlib_tarball}"
getSource "${zstd_dnl}" "${zstd_sha256}" "${zstd_tarball}"

cp ${CWD}/CH8Build/libressl-${libressl_version}-cnf-name.patch .
cp ${CWD}/CH8Build/make-ca-${makeca_version}-libressl.patch .
cp ${CWD}/CH8Build/certdata-dist.txt .

rm -f ${HOME}/lfs-sources.tar
tar -cpf ${HOME}/lfs-sources.tar .
echo "Sources backed-up as ${HOME}/lfs-sources.tar"


popd > /dev/null 2>&1

