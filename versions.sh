#!/bin/bash

function myfail {
  echo "$1"
  exit 1
}

acl_version="2.3.2"
acl_dnl="https://download.savannah.gnu.org/releases/acl/acl-${acl_version}.tar.xz"
acl_sha256="97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd"
acl_tarball="acl-${acl_version}.tar.xz"

attr_version="2.5.2"
attr_dnl="https://download.savannah.gnu.org/releases/attr/attr-${attr_version}.tar.gz"
attr_sha256="39bf67452fa41d0948c2197601053f48b3d78a029389734332a6309a680c6c87"
attr_tarball="attr-${attr_version}.tar.gz"

autoconf_version="2.72"
autoconf_dnl="https://ftp.gnu.org/gnu/autoconf/autoconf-${autoconf_version}.tar.xz"
autoconf_sha256="ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a"
autoconf_tarball="autoconf-${autoconf_version}.tar.xz"

automake_version="1.17"
automake_dnl="https://ftp.gnu.org/gnu/automake/automake-${automake_version}.tar.xz"
automake_sha256="8920c1fc411e13b90bf704ef9db6f29d540e76d232cb3b2c9f4dc4cc599bd990"
automake_tarball="automake-${automake_version}.tar.xz"

bash_version="5.2.32"
bash_dnl="https://ftp.gnu.org/gnu/bash/bash-${bash_version}.tar.gz"
bash_sha256="d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
bash_tarball="bash-${bash_version}.tar.gz"

bc_version="6.7.6"
bc_dnl="https://github.com/gavinhoward/bc/releases/download/${bc_version}/bc-${bc_version}.tar.xz"
bc_sha256="828f390c2a552cadbc8c8ad5fde6eeaee398dc8d59d706559158330f3629ce35"
bc_tarball="bc-${bc_version}.tar.xz"

binutils_version="2.43.1"
binutils_dnl="https://sourceware.org/pub/binutils/releases/binutils-${binutils_version}.tar.xz"
binutils_sha256="13f74202a3c4c51118b797a39ea4200d3f6cfbe224da6d1d95bb938480132dfd"
binutils_tarball="binutils-${binutils_version}.tar.xz"

bison_version="3.8.2"
bison_dnl="https://ftp.gnu.org/gnu/bison/bison-${bison_version}.tar.xz"
bison_sha256="9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
bison_tarball="bison-${bison_version}.tar.xz"

bzip2_version="1.0.8"
bzip2_dnl="https://www.sourceware.org/pub/bzip2/bzip2-${bzip2_version}.tar.gz"
bzip2_sha256="ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
bzip2_tarball="bzip2-${bzip2_version}.tar.gz"

bzip2_patch_dnl="https://www.linuxfromscratch.org/patches/lfs/12.2/bzip2-1.0.8-install_docs-1.patch"
bzip2_patch_sha256="35e3bbd9642af51fef2a8a83afba040d272da42d7e3a251d8e43255a7b496702"
bzip2_patch_file="bzip2-1.0.8-install_docs-1.patch"

check_version="0.15.2"
check_dnl="https://github.com/libcheck/check/releases/download/${check_version}/check-${check_version}.tar.gz"
check_sha256="a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a"
check_tarball="check-${check_version}.tar.gz"

coreutils_version="9.5"
coreutils_dnl="https://ftp.gnu.org/gnu/coreutils/coreutils-${coreutils_version}.tar.xz"
coreutils_sha256="cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a"
coreutils_tarball="coreutils-${coreutils_version}.tar.xz"

coreutils_patch_dnl="https://www.linuxfromscratch.org/patches/lfs/12.2/coreutils-9.5-i18n-2.patch"
coreutils_patch_sha256="99f1553ce9b7ded634bb56dac14ba6e439fc124daf8da436ee4cda1fd286f4a2"
coreutils_patch_file="coreutils-9.5-i18n-2.patch"

dbus_version="1.14.10"
dbus_dnl="https://dbus.freedesktop.org/releases/dbus/dbus-${dbus_version}.tar.xz"
dbus_sha256="ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f"
dbus_tarball="dbus-${dbus_version}.tar.xz"

diffutils_version="3.10"
diffutils_dnl="https://ftp.gnu.org/gnu/diffutils/diffutils-${diffutils_version}.tar.xz"
diffutils_sha256="90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e"
diffutils_tarball="diffutils-${diffutils_version}.tar.xz"

e2fsprogs_dnl="https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.47.1/e2fsprogs-1.47.1.tar.gz"
e2fsprogs_sha256="9afcd201f39429d2db2492aeb13dba5e75d6cc50682b732dca35643bd5f092e3"
e2fsprogs_tarball="e2fsprogs-1.47.1.tar.gz"

elfutils_dnl="https://sourceware.org/ftp/elfutils/0.191/elfutils-0.191.tar.bz2"
elfutils_sha256="df76db71366d1d708365fc7a6c60ca48398f14367eb2b8954efc8897147ad871"
elfutils_tarball="elfutils-0.191.tar.bz2"

expat_dnl="https://prdownloads.sourceforge.net/expat/expat-2.6.2.tar.xz"
expat_sha256="ee14b4c5d8908b1bec37ad937607eab183d4d9806a08adee472c3c3121d27364"
expat_tarball="expat-2.6.2.tar.xz"

expect_dnl="https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz"
expect_sha256="49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
expect_tarball="expect5.45.4.tar.gz"

expect_patch_dnl="https://www.linuxfromscratch.org/patches/lfs/12.2/expect-5.45.4-gcc14-1.patch"
expect_patch_sha256="517c0cdd5db949cdd99dfa38b7a6c3945e1524c50e3467028973298f2c76a92c"
expect_patch_file="expect-5.45.4-gcc14-1.patch"

file_version="5.45"
file_dnl="https://astron.com/pub/file/file-${file_version}.tar.gz"
file_sha256="fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82"
file_tarball="file-${file_version}.tar.gz"

findutils_version="4.10.0"
findutils_dnl="https://ftp.gnu.org/gnu/findutils/findutils-${findutils_version}.tar.xz"
findutils_sha256="1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5"
findutils_tarball="findutils-${findutils_version}.tar.xz"

flex_dnl="https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz"
flex_sha256="e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
flex_tarball="flex-2.6.4.tar.gz"

flit_core_dnl="https://pypi.org/packages/source/f/flit-core/flit_core-3.9.0.tar.gz"
flit_core_sha256="72ad266176c4a3fcfab5f2930d76896059851240570ce9a98733b658cb786eba"
flit_core_tarball="flit_core-3.9.0.tar.gz"

gawk_version="5.3.0"
gawk_dnl="https://ftp.gnu.org/gnu/gawk/gawk-${gawk_version}.tar.xz"
gawk_sha256="ca9c16d3d11d0ff8c69d79dc0b47267e1329a69b39b799895604ed447d3ca90b"
gawk_tarball="gawk-${gawk_version}.tar.xz"

gcc_version="14.2.0"
gcc_dnl="https://ftp.gnu.org/gnu/gcc/gcc-${gcc_version}/gcc-${gcc_version}.tar.xz"
gcc_sha256="a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9"
gcc_tarball="gcc-${gcc_version}.tar.xz"

gdbm_dnl="https://ftp.gnu.org/gnu/gdbm/gdbm-1.24.tar.gz"
gdbm_sha256="695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf"
gdbm_tarball="gdbm-1.24.tar.gz"

gettext_dnl="https://ftp.gnu.org/gnu/gettext/gettext-0.22.5.tar.xz"
gettext_sha256="fe10c37353213d78a5b83d48af231e005c4da84db5ce88037d88355938259640"
gettext_tarball="gettext-0.22.5.tar.xz"

glibc_version="2.40"
glibc_dnl="https://ftp.gnu.org/gnu/glibc/glibc-${glibc_version}.tar.xz"
glibc_sha256="19a890175e9263d748f627993de6f4b1af9cd21e03f080e4bfb3a1fac10205a2"
glibc_tarball="glibc-${glibc_version}.tar.xz"

glibc_patch_dnl="https://www.linuxfromscratch.org/patches/lfs/12.2/glibc-${glibc_version}-fhs-1.patch"
glibc_patch_sha256="643552db030e2f2d7ffde4f558e0f5f83d3fabf34a2e0e56ebdb49750ac27b0d"
glibc_patch_file="glibc-${glibc_version}-fhs-1.patch"

gmp_version="6.3.0"
gmp_dnl="https://ftp.gnu.org/gnu/gmp/gmp-${gmp_version}.tar.xz"
gmp_sha256="a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898"
gmp_tarball="gmp-${gmp_version}.tar.xz"

gperf_dnl="https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz"
gperf_sha256="588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
gperf_tarball="gperf-3.1.tar.gz"

grep_version="3.11"
grep_dnl="https://ftp.gnu.org/gnu/grep/grep-${grep_version}.tar.xz"
grep_sha256="1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab"
grep_tarball="grep-${grep_version}.tar.xz"

groff_dnl="https://ftp.gnu.org/gnu/groff/groff-1.23.0.tar.gz"
groff_sha256="6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
groff_tarball="groff-1.23.0.tar.gz"

grub_dnl="https://ftp.gnu.org/gnu/grub/grub-2.12.tar.xz"
grub_sha256="f3c97391f7c4eaa677a78e090c7e97e6dc47b16f655f04683ebd37bef7fe0faa"
grub_tarball="grub-2.12.tar.xz"

gzip_version="1.13"
gzip_dnl="https://ftp.gnu.org/gnu/gzip/gzip-${gzip_version}.tar.xz"
gzip_sha256="7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057"
gzip_tarball="gzip-${gzip_version}.tar.xz"

iana_etc_dnl="https://github.com/Mic92/iana-etc/releases/download/20240806/iana-etc-20240806.tar.gz"
iana_etc_sha256="672dbe1ba52b889a46dc07ee3876664ed601983239f82d729d02a002475a5b66"
iana_etc_tarball="iana-etc-20240806.tar.gz"

inetutils_dnl="https://ftp.gnu.org/gnu/inetutils/inetutils-2.5.tar.xz"
inetutils_sha256="87697d60a31e10b5cb86a9f0651e1ec7bee98320d048c0739431aac3d5764fb6"
inetutils_tarball="inetutils-2.5.tar.xz"

intltool_dnl="https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz"
intltool_sha256="67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
intltool_tarball="intltool-0.51.0.tar.gz"

iproute2_dnl="https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.10.0.tar.xz"
iproute2_sha256="91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce"
iproute2_tarball="iproute2-6.10.0.tar.xz"

jinja2_dnl="https://pypi.org/packages/source/J/Jinja2/jinja2-3.1.4.tar.gz"
jinja2_sha256="4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
jinja2_tarball="jinja2-3.1.4.tar.gz"

kbd_dnl="https://www.kernel.org/pub/linux/utils/kbd/kbd-2.6.4.tar.xz"
kbd_sha256="519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926"
kbd_tarball="kbd-2.6.4.tar.xz"

kbd_patch_dnl="https://www.linuxfromscratch.org/patches/lfs/12.2/kbd-2.6.4-backspace-1.patch"
kbd_patch_sha256="8be28dcb11420624a500f2ea4fe975f771174bffee50e54ec8cd295a2dec104e"
kbd_patch_file="kbd-2.6.4-backspace-1.patch"

kmod_dnl="https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-33.tar.xz"
kmod_sha256="dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc"
kmod_tarball="kmod-33.tar.xz"

less_dnl="https://www.greenwoodsoftware.com/less/less-661.tar.gz"
less_sha256="2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed"
less_tarball="less-661.tar.gz"

libcap_dnl="https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.70.tar.xz"
libcap_sha256="23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f"
libcap_tarball="libcap-2.70.tar.xz"

libffi_dnl="https://github.com/libffi/libffi/releases/download/v3.4.6/libffi-3.4.6.tar.gz"
libffi_sha256="b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e"
libffi_tarball="libffi-3.4.6.tar.gz"

libpipeline_dnl="https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.7.tar.gz"
libpipeline_sha256="b8b45194989022a79ec1317f64a2a75b1551b2a55bea06f67704cb2a2e4690b0"
libpipeline_tarball="libpipeline-1.5.7.tar.gz"

libressl_dnl="https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.9.2.tar.gz"
libressl_sha256="7b031dac64a59eb6ee3304f7ffb75dad33ab8c9d279c847f92c89fb846068f97"
libressl_tarball="libressl-3.9.2.tar.gz"

libtool_dnl="https://ftp.gnu.org/gnu/libtool/libtool-2.4.7.tar.xz"
libtool_sha256="4f7f217f057ce655ff22559ad221a0fd8ef84ad1fc5fcb6990cecc333aa1635d"
libtool_tarball="libtool-2.4.7.tar.xz"

libxcrypt_dnl="https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz"
libxcrypt_sha256="e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943"
libxcrypt_tarball="libxcrypt-4.4.36.tar.xz"

linux_lts_version="6.6.53"
linux_lts_dnl="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${linux_lts_version}.tar.xz"
linux_lts_sha256="285d181d1b252b0bf905f040d094215cf183ac98c31a17f9cce9f3537ef4d779"
linux_lts_tarball="linux-${linux_lts_version}.tar.xz"

lz4_dnl="https://github.com/lz4/lz4/releases/download/v1.10.0/lz4-1.10.0.tar.gz"
lz4_sha256="537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b"
lz4_tarball="lz4-1.10.0.tar.gz"

m4_version="1.4.19"
m4_dnl="https://ftp.gnu.org/gnu/m4/m4-${m4_version}.tar.xz"
m4_sha256="63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96"
m4_tarball="m4-${m4_version}.tar.xz"

make_version="4.4.1"
make_dnl="https://ftp.gnu.org/gnu/make/make-${make_version}.tar.gz"
make_sha256="dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3"
make_tarball="make-${make_version}.tar.gz"

mandb_dnl="https://download.savannah.gnu.org/releases/man-db/man-db-2.12.1.tar.xz"
mandb_sha256="ddee249daeb78cf92bab794ccd069cc8b575992265ea20e239e887156e880265"
mandb_tarball="man-db-2.12.1.tar.xz"

man_pages_dnl="https://www.kernel.org/pub/linux/docs/man-pages/man-pages-6.9.1.tar.xz"
man_pages_sha256="e23cbac29f110ba571f0da8523e79d373691466ed7f2a31301721817d34530bd"
man_pages_tarball="man-pages-6.9.1.tar.xz"

markupsafe_dnl="https://pypi.org/packages/source/M/MarkupSafe/MarkupSafe-2.1.5.tar.gz"
markupsafe_sha256="d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b"
markupsafe_tarball="MarkupSafe-2.1.5.tar.gz"

meson_dnl="https://github.com/mesonbuild/meson/releases/download/1.5.1/meson-1.5.1.tar.gz"
meson_sha256="567e533adf255de73a2de35049b99923caf872a455af9ce03e01077e0d384bed"
meson_tarball="meson-1.5.1.tar.gz"

mpc_version="1.3.1"
mpc_dnl="https://ftp.gnu.org/gnu/mpc/mpc-${mpc_version}.tar.gz"
mpc_sha256="ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8"
mpc_tarball="mpc-${mpc_version}.tar.gz"

mpfr_version="4.2.1"
mpfr_dnl="https://ftp.gnu.org/gnu/mpfr/mpfr-${mpfr_version}.tar.xz"
mpfr_sha256="277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2"
mpfr_tarball="mpfr-${mpfr_version}.tar.xz"

ncurses_dnl="https://invisible-mirror.net/archives/ncurses/ncurses-6.5.tar.gz"
ncurses_sha256="136d91bc269a9a5785e5f9e980bc76ab57428f604ce3e5a5a90cebc767971cc6"
ncurses_tarball="ncurses-6.5.tar.gz"

ninja_dnl="https://github.com/ninja-build/ninja/archive/v1.12.1/ninja-1.12.1.tar.gz"
ninja_sha256="821bdff48a3f683bc4bb3b6f0b5fe7b2d647cf65d52aeb63328c91a6c6df285a"
ninja_tarball="ninja-1.12.1.tar.gz"

patch_version="2.7.6"
patch_dnl="https://ftp.gnu.org/gnu/patch/patch-${patch_version}.tar.xz"
patch_sha256="ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd"
patch_tarball="patch-${patch_version}.tar.xz"

perl_dnl="https://www.cpan.org/src/5.0/perl-5.40.0.tar.xz"
perl_sha256="d5325300ad267624cb0b7d512cfdfcd74fa7fe00c455c5b51a6bd53e5e199ef9"
perl_tarball="perl-5.40.0.tar.xz"

pkgconf_dnl="https://distfiles.ariadne.space/pkgconf/pkgconf-2.3.0.tar.xz"
pkgconf_sha256="3a9080ac51d03615e7c1910a0a2a8df08424892b5f13b0628a204d3fcce0ea8b"
pkgconf_tarball="pkgconf-2.3.0.tar.xz"

procps_dnl="https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-4.0.4.tar.xz"
procps_sha256="22870d6feb2478adb617ce4f09a787addaf2d260c5a8aa7b17d889a962c5e42e"
procps_tarball="procps-ng-4.0.4.tar.xz"

psmisc_dnl="https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.7.tar.xz"
psmisc_sha256="58c55d9c1402474065adae669511c191de374b0871eec781239ab400b907c327"
psmisc_tarball="psmisc-23.7.tar.xz"

python_dnl="https://www.python.org/ftp/python/3.12.6/Python-3.12.6.tar.xz"
python_sha256="1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c"
python_tarball="Python-3.12.6.tar.xz"

pythondoc_dnl="https://www.python.org/ftp/python/doc/3.12.6/python-3.12.6-docs-html.tar.bz2"
pythondoc_sha256="aeafb222b40afcf04b1757071db49cf17df8716407c4e99dd7ea03d355030198"
pythondoc_tarball="python-3.12.6-docs-html.tar.bz2"

readline_dnl="https://ftp.gnu.org/gnu/readline/readline-8.2.13.tar.gz"
readline_sha256="0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656"
readline_tarball="readline-8.2.13.tar.gz"

sed_version="4.9"
sed_dnl="https://ftp.gnu.org/gnu/sed/sed-${sed_version}.tar.xz"
sed_sha256="6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181"
sed_tarball="sed-${sed_version}.tar.xz"

setuptools_dnl="https://files.pythonhosted.org/packages/27/b8/f21073fde99492b33ca357876430822e4800cdf522011f18041351dfa74b/setuptools-75.1.0.tar.gz"
setuptools_sha256="d59a21b17a275fb872a9c3dae73963160ae079f1049ed956880cd7c09b120538"
setuptools_tarball="setuptools-75.1.0.tar.gz"

shadow_dnl="https://github.com/shadow-maint/shadow/releases/download/4.16.0/shadow-4.16.0.tar.xz"
shadow_sha256="b78e3921a95d53282a38e90628880624736bf6235e36eea50c50835f59a3530b"
shadow_tarball="shadow-4.16.0.tar.xz"

systemd_dnl="https://github.com/systemd/systemd/archive/v256.4/systemd-256.4.tar.gz"
systemd_sha256="7861d544190f938cac1b242624d78c96fe2ebbc7b72f86166e88b50451c6fa58"
systemd_tarball="systemd-256.4.tar.gz"

systemd_man_dnl="https://anduin.linuxfromscratch.org/LFS/systemd-man-pages-256.4.tar.xz"
systemd_man_sha256="dceb4cc699b3801c38d99f88618ca7e7f7e23ee6016a8b7eef3ed361d852d340"
systemd_man_tarball="systemd-man-pages-256.4.tar.xz"

tar_version="1.35"
tar_dnl="https://ftp.gnu.org/gnu/tar/tar-${tar_version}.tar.xz"
tar_sha256="4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16"
tar_tarball="tar-${tar_version}.tar.xz"

tcl_dnl="https://downloads.sourceforge.net/tcl/tcl8.6.14-src.tar.gz"
tcl_sha256="5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66"
tcl_tarball="tcl8.6.14-src.tar.gz"

tcl_doc_dnl="https://downloads.sourceforge.net/tcl/tcl8.6.14-html.tar.gz"
tcl_doc_sha256="bfd319033beeeead986f46be0a3a3ef6ee35424770f7836dca45bbc0ba27ee5f"
tcl_doc_tarball="tcl8.6.14-html.tar.gz"

texinfo_dnl="https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.tar.xz"
texinfo_sha256="deeec9f19f159e046fdf8ad22231981806dac332cc372f1c763504ad82b30953"
texinfo_tarball="texinfo-7.1.tar.xz"

tzdata_dnl="https://www.iana.org/time-zones/repository/releases/tzdata2024a.tar.gz"
tzdata_sha256="0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
tzdata_tarball="tzdata2024a.tar.gz"

util_linux_dnl="https://www.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.2.tar.xz"
util_linux_sha256="d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
util_linux_tarball="util-linux-2.40.2.tar.xz"

vim_dnl="https://github.com/vim/vim/archive/refs/tags/v9.1.0751.tar.gz"
vim_sha256="efa1be453c97a3bff693835d7b64a14dee8bb7619bd893ce6f12c2cf5dafc7a3"
vim_tarball="v9.1.0751.tar.gz"

wheel_dnl="https://pypi.org/packages/source/w/wheel/wheel-0.44.0.tar.gz"
wheel_sha256="a29c3f2817e95ab89aa4660681ad547c0e9547f20e75b0562fe7723c9a2a9d49"
wheel_tarball="wheel-0.44.0.tar.gz"

xml_parser_dnl="https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.47.tar.gz"
xml_parser_sha256="ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8"
xml_parser_tarball="XML-Parser-2.47.tar.gz"

xz_version="5.6.2"
xz_dnl="https://github.com//tukaani-project/xz/releases/download/v${xz_version}/xz-${xz_version}.tar.xz"
xz_sha256="a9db3bb3d64e248a0fae963f8fb6ba851a26ba1822e504dc0efd18a80c626caf"
xz_tarball="xz-${xz_version}.tar.xz"

zlib_dnl="https://zlib.net/fossils/zlib-1.3.1.tar.gz"
zlib_sha256="9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
zlib_tarball="zlib-1.3.1.tar.gz"

zstd_dnl="https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz"
zstd_sha256="8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1"
zstd_tarball="zstd-1.5.6.tar.gz"
