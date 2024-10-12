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

bash_version="5.2.37"
bash_dnl="https://ftp.gnu.org/gnu/bash/bash-${bash_version}.tar.gz"
bash_sha256="9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff"
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

cracklib_version="2.10.2"
cracklib_dnl="https://github.com/cracklib/cracklib/releases/download/v${cracklib_version}/cracklib-${cracklib_version}.tar.xz"
cracklib_sha256="febfa832ec11e6a12942daf0dbaa0acdbd2242920202edfedde2abbc030d3b0c"
cracklib_tarball="cracklib-${cracklib_version}.tar.xz"

cracklib_words_english_dnl="https://github.com/cracklib/cracklib/releases/download/v${cracklib_version}/cracklib-words-${cracklib_version}.xz"
cracklib_words_english_sha256="b3d1e0e0ae9bc7ffed65c0042d7c68bdb903368aa6b918f94572453c6ea874dc"
cracklib_words_english_tarball="cracklib-words-${cracklib_version}.xz"

dbus_version="1.14.10"
dbus_dnl="https://dbus.freedesktop.org/releases/dbus/dbus-${dbus_version}.tar.xz"
dbus_sha256="ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f"
dbus_tarball="dbus-${dbus_version}.tar.xz"

dejagnu_version="1.6.3"
dejagnu_dnl="https://ftp.gnu.org/gnu/dejagnu/dejagnu-${dejagnu_version}.tar.gz"
dejagnu_sha256="87daefacd7958b4a69f88c6856dbd1634261963c414079d0c371f589cd66a2e3"
dejagnu_tarball="dejagnu-${dejagnu_version}.tar.gz"

diffutils_version="3.10"
diffutils_dnl="https://ftp.gnu.org/gnu/diffutils/diffutils-${diffutils_version}.tar.xz"
diffutils_sha256="90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e"
diffutils_tarball="diffutils-${diffutils_version}.tar.xz"

e2fsprogs_version="1.47.1"
e2fsprogs_dnl="https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v${e2fsprogs_version}/e2fsprogs-${e2fsprogs_version}.tar.gz"
e2fsprogs_sha256="9afcd201f39429d2db2492aeb13dba5e75d6cc50682b732dca35643bd5f092e3"
e2fsprogs_tarball="e2fsprogs-${e2fsprogs_version}.tar.gz"

elfutils_version="0.191"
elfutils_dnl="https://sourceware.org/ftp/elfutils/${elfutils_version}/elfutils-${elfutils_version}.tar.bz2"
elfutils_sha256="df76db71366d1d708365fc7a6c60ca48398f14367eb2b8954efc8897147ad871"
elfutils_tarball="elfutils-${elfutils_version}.tar.bz2"

expat_version="2.6.3"
expat_dnl="https://prdownloads.sourceforge.net/expat/expat-${expat_version}.tar.xz"
expat_sha256="274db254a6979bde5aad404763a704956940e465843f2a9bd9ed7af22e2c0efc"
expat_tarball="expat-${expat_version}.tar.xz"

expect_version="5.45.4"
expect_dnl="https://prdownloads.sourceforge.net/expect/expect${expect_version}.tar.gz"
expect_sha256="49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
expect_tarball="expect${expect_version}.tar.gz"

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

flex_version="2.6.4"
flex_dnl="https://github.com/westes/flex/releases/download/v${flex_version}/flex-${flex_version}.tar.gz"
flex_sha256="e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
flex_tarball="flex-${flex_version}.tar.gz"

flit_core_version="3.9.0"
flit_core_dnl="https://pypi.org/packages/source/f/flit-core/flit_core-${flit_core_version}.tar.gz"
flit_core_sha256="72ad266176c4a3fcfab5f2930d76896059851240570ce9a98733b658cb786eba"
flit_core_tarball="flit_core-${flit_core_version}.tar.gz"

gawk_version="5.3.1"
gawk_dnl="https://ftp.gnu.org/gnu/gawk/gawk-${gawk_version}.tar.xz"
gawk_sha256="694db764812a6236423d4ff40ceb7b6c4c441301b72ad502bb5c27e00cd56f78"
gawk_tarball="gawk-${gawk_version}.tar.xz"

gcc_version="14.2.0"
gcc_dnl="https://ftp.gnu.org/gnu/gcc/gcc-${gcc_version}/gcc-${gcc_version}.tar.xz"
gcc_sha256="a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9"
gcc_tarball="gcc-${gcc_version}.tar.xz"

gdbm_version="1.24"
gdbm_dnl="https://ftp.gnu.org/gnu/gdbm/gdbm-${gdbm_version}.tar.gz"
gdbm_sha256="695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf"
gdbm_tarball="gdbm-${gdbm_version}.tar.gz"

gettext_version="0.22.5"
gettext_dnl="https://ftp.gnu.org/gnu/gettext/gettext-${gettext_version}.tar.xz"
gettext_sha256="fe10c37353213d78a5b83d48af231e005c4da84db5ce88037d88355938259640"
gettext_tarball="gettext-${gettext_version}.tar.xz"

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

gperf_version="3.1"
gperf_dnl="https://ftp.gnu.org/gnu/gperf/gperf-${gperf_version}.tar.gz"
gperf_sha256="588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
gperf_tarball="gperf-${gperf_version}.tar.gz"

grep_version="3.11"
grep_dnl="https://ftp.gnu.org/gnu/grep/grep-${grep_version}.tar.xz"
grep_sha256="1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab"
grep_tarball="grep-${grep_version}.tar.xz"

groff_version="1.23.0"
groff_dnl="https://ftp.gnu.org/gnu/groff/groff-${groff_version}.tar.gz"
groff_sha256="6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
groff_tarball="groff-${groff_version}.tar.gz"

grub_version="2.12"
grub_dnl="https://ftp.gnu.org/gnu/grub/grub-${grub_version}.tar.xz"
grub_sha256="f3c97391f7c4eaa677a78e090c7e97e6dc47b16f655f04683ebd37bef7fe0faa"
grub_tarball="grub-${grub_version}.tar.xz"

gzip_version="1.13"
gzip_dnl="https://ftp.gnu.org/gnu/gzip/gzip-${gzip_version}.tar.xz"
gzip_sha256="7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057"
gzip_tarball="gzip-${gzip_version}.tar.xz"

iana_etc_version="20240806"
iana_etc_dnl="https://github.com/Mic92/iana-etc/releases/download/20240806/iana-etc-${iana_etc_version}.tar.gz"
iana_etc_sha256="672dbe1ba52b889a46dc07ee3876664ed601983239f82d729d02a002475a5b66"
iana_etc_tarball="iana-etc-${iana_etc_version}.tar.gz"

inetutils_version="2.5"
inetutils_dnl="https://ftp.gnu.org/gnu/inetutils/inetutils-${inetutils_version}.tar.xz"
inetutils_sha256="87697d60a31e10b5cb86a9f0651e1ec7bee98320d048c0739431aac3d5764fb6"
inetutils_tarball="inetutils-${inetutils_version}.tar.xz"

intltool_version="0.51.0"
intltool_dnl="https://launchpad.net/intltool/trunk/${intltool_version}/+download/intltool-${intltool_version}.tar.gz"
intltool_sha256="67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
intltool_tarball="intltool-${intltool_version}.tar.gz"

iproute2_version="6.11.0"
iproute2_dnl="https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-${iproute2_version}.tar.xz"
iproute2_sha256="1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3"
iproute2_tarball="iproute2-${iproute2_version}.tar.xz"

jinja2_version="3.1.4"
jinja2_dnl="https://pypi.org/packages/source/J/Jinja2/jinja2-${jinja2_version}.tar.gz"
jinja2_sha256="4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
jinja2_tarball="jinja2-${jinja2_version}.tar.gz"

kbd_version="2.6.4"
kbd_dnl="https://www.kernel.org/pub/linux/utils/kbd/kbd-${kbd_version}.tar.xz"
kbd_sha256="519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926"
kbd_tarball="kbd-${kbd_version}.tar.xz"

kbd_patch_dnl="https://www.linuxfromscratch.org/patches/lfs/12.2/kbd-2.6.4-backspace-1.patch"
kbd_patch_sha256="8be28dcb11420624a500f2ea4fe975f771174bffee50e54ec8cd295a2dec104e"
kbd_patch_file="kbd-2.6.4-backspace-1.patch"

kmod_version="33"
kmod_dnl="https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-${kmod_version}.tar.xz"
kmod_sha256="dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc"
kmod_tarball="kmod-${kmod_version}.tar.xz"

less_version="661"
less_dnl="https://www.greenwoodsoftware.com/less/less-${less_version}.tar.gz"
less_sha256="2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed"
less_tarball="less-${less_version}.tar.gz"

libcap_version="2.70"
libcap_dnl="https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-${libcap_version}.tar.xz"
libcap_sha256="23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f"
libcap_tarball="libcap-${libcap_version}.tar.xz"

libffi_version="3.4.6"
libffi_dnl="https://github.com/libffi/libffi/releases/download/v${libffi_version}/libffi-${libffi_version}.tar.gz"
libffi_sha256="b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e"
libffi_tarball="libffi-${libffi_version}.tar.gz"

libpipeline_version="1.5.8"
libpipeline_dnl="https://download.savannah.gnu.org/releases/libpipeline/libpipeline-${libpipeline_version}.tar.gz"
libpipeline_sha256="1b1203ca152ccd63983c3f2112f7fe6fa5afd453218ede5153d1b31e11bb8405"
libpipeline_tarball="libpipeline-${libpipeline_version}.tar.gz"

libressl_version="3.9.2"
libressl_dnl="https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${libressl_version}.tar.gz"
libressl_sha256="7b031dac64a59eb6ee3304f7ffb75dad33ab8c9d279c847f92c89fb846068f97"
libressl_tarball="libressl-${libressl_version}.tar.gz"

libtool_version="2.5.3"
libtool_dnl="https://ftp.gnu.org/gnu/libtool/libtool-${libtool_version}.tar.xz"
libtool_sha256="898011232cc59b6b3bbbe321b60aba9db1ac11578ab61ed0df0299458146ae2e"
libtool_tarball="libtool-${libtool_version}.tar.xz"

libxcrypt_version="4.4.36"
libxcrypt_dnl="https://github.com/besser82/libxcrypt/releases/download/v${libxcrypt_version}/libxcrypt-${libxcrypt_version}.tar.xz"
libxcrypt_sha256="e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943"
libxcrypt_tarball="libxcrypt-${libxcrypt_version}.tar.xz"

linux_lts_version="6.6.56"
linux_lts_dnl="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${linux_lts_version}.tar.xz"
linux_lts_sha256="f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95"
linux_lts_tarball="linux-${linux_lts_version}.tar.xz"

lz4_version="1.10.0"
lz4_dnl="https://github.com/lz4/lz4/releases/download/v${lz4_version}/lz4-${lz4_version}.tar.gz"
lz4_sha256="537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b"
lz4_tarball="lz4-${lz4_version}.tar.gz"

m4_version="1.4.19"
m4_dnl="https://ftp.gnu.org/gnu/m4/m4-${m4_version}.tar.xz"
m4_sha256="63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96"
m4_tarball="m4-${m4_version}.tar.xz"

make_version="4.4.1"
make_dnl="https://ftp.gnu.org/gnu/make/make-${make_version}.tar.gz"
make_sha256="dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3"
make_tarball="make-${make_version}.tar.gz"

mandb_version="2.13.0"
mandb_dnl="https://download.savannah.gnu.org/releases/man-db/man-db-${mandb_version}.tar.xz"
mandb_sha256="82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
mandb_tarball="man-db-${mandb_version}.tar.xz"

man_pages_version="6.9.1"
man_pages_dnl="https://www.kernel.org/pub/linux/docs/man-pages/man-pages-${man_pages_version}.tar.xz"
man_pages_sha256="e23cbac29f110ba571f0da8523e79d373691466ed7f2a31301721817d34530bd"
man_pages_tarball="man-pages-${man_pages_version}.tar.xz"

markupsafe_version="2.1.5"
markupsafe_dnl="https://pypi.org/packages/source/M/MarkupSafe/MarkupSafe-${markupsafe_version}.tar.gz"
markupsafe_sha256="d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b"
markupsafe_tarball="MarkupSafe-${markupsafe_version}.tar.gz"

meson_version="1.5.2"
meson_dnl="https://github.com/mesonbuild/meson/releases/download/${meson_version}/meson-${meson_version}.tar.gz"
meson_sha256="f955e09ab0d71ef180ae85df65991d58ed8430323de7d77a37e11c9ea630910b"
meson_tarball="meson-${meson_version}.tar.gz"

mpc_version="1.3.1"
mpc_dnl="https://ftp.gnu.org/gnu/mpc/mpc-${mpc_version}.tar.gz"
mpc_sha256="ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8"
mpc_tarball="mpc-${mpc_version}.tar.gz"

mpfr_version="4.2.1"
mpfr_dnl="https://ftp.gnu.org/gnu/mpfr/mpfr-${mpfr_version}.tar.xz"
mpfr_sha256="277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2"
mpfr_tarball="mpfr-${mpfr_version}.tar.xz"

ncurses_version="6.5"
ncurses_dnl="https://invisible-mirror.net/archives/ncurses/ncurses-${ncurses_version}.tar.gz"
ncurses_sha256="136d91bc269a9a5785e5f9e980bc76ab57428f604ce3e5a5a90cebc767971cc6"
ncurses_tarball="ncurses-${ncurses_version}.tar.gz"

ninja_version="1.12.1"
ninja_dnl="https://github.com/ninja-build/ninja/archive/v${ninja_version}/ninja-${ninja_version}.tar.gz"
ninja_sha256="821bdff48a3f683bc4bb3b6f0b5fe7b2d647cf65d52aeb63328c91a6c6df285a"
ninja_tarball="ninja-${ninja_version}.tar.gz"

openssl_version="3.3.2"
openssl_dnl="https://github.com/openssl/openssl/releases/download/openssl-${openssl_version}/openssl-${openssl_version}.tar.gz"
openssl_sha256="2e8a40b01979afe8be0bbfb3de5dc1c6709fedb46d6c89c10da114ab5fc3d281"
openssl_tarball="openssl-${openssl_version}.tar.gz"

patch_version="2.7.6"
patch_dnl="https://ftp.gnu.org/gnu/patch/patch-${patch_version}.tar.xz"
patch_sha256="ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd"
patch_tarball="patch-${patch_version}.tar.xz"

perl_major_version="5"
perl_minor_version="40"
perl_patch_version="0"
perl_version="${perl_major_version}.${perl_minor_version}.${perl_patch_version}"
perl_dnl="https://www.cpan.org/src/5.0/perl-${perl_version}.tar.xz"
perl_sha256="d5325300ad267624cb0b7d512cfdfcd74fa7fe00c455c5b51a6bd53e5e199ef9"
perl_tarball="perl-${perl_version}.tar.xz"

pkgconf_version="2.3.0"
pkgconf_dnl="https://distfiles.ariadne.space/pkgconf/pkgconf-${pkgconf_version}.tar.xz"
pkgconf_sha256="3a9080ac51d03615e7c1910a0a2a8df08424892b5f13b0628a204d3fcce0ea8b"
pkgconf_tarball="pkgconf-${pkgconf_version}.tar.xz"

procps_version="4.0.4"
procps_dnl="https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-${procps_version}.tar.xz"
procps_sha256="22870d6feb2478adb617ce4f09a787addaf2d260c5a8aa7b17d889a962c5e42e"
procps_tarball="procps-ng-${procps_version}.tar.xz"

psmisc_version="23.7"
psmisc_dnl="https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-${psmisc_version}.tar.xz"
psmisc_sha256="58c55d9c1402474065adae669511c191de374b0871eec781239ab400b907c327"
psmisc_tarball="psmisc-${psmisc_version}.tar.xz"

python_version="3.12.6"
python_dnl="https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tar.xz"
python_sha256="1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c"
python_tarball="Python-${python_version}.tar.xz"

pythondoc_dnl="https://www.python.org/ftp/python/doc/${python_version}/python-${python_version}-docs-html.tar.bz2"
pythondoc_sha256="aeafb222b40afcf04b1757071db49cf17df8716407c4e99dd7ea03d355030198"
pythondoc_tarball="python-${python_version}-docs-html.tar.bz2"

readline_version="8.2.13"
readline_dnl="https://ftp.gnu.org/gnu/readline/readline-${readline_version}.tar.gz"
readline_sha256="0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656"
readline_tarball="readline-${readline_version}.tar.gz"

sed_version="4.9"
sed_dnl="https://ftp.gnu.org/gnu/sed/sed-${sed_version}.tar.xz"
sed_sha256="6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181"
sed_tarball="sed-${sed_version}.tar.xz"

setuptools_version="75.1.0"
setuptools_dnl="https://files.pythonhosted.org/packages/27/b8/f21073fde99492b33ca357876430822e4800cdf522011f18041351dfa74b/setuptools-${setuptools_version}.tar.gz"
setuptools_sha256="d59a21b17a275fb872a9c3dae73963160ae079f1049ed956880cd7c09b120538"
setuptools_tarball="setuptools-${setuptools_version}.tar.gz"

shadow_version="4.16.0"
shadow_dnl="https://github.com/shadow-maint/shadow/releases/download/${shadow_version}/shadow-${shadow_version}.tar.xz"
shadow_sha256="b78e3921a95d53282a38e90628880624736bf6235e36eea50c50835f59a3530b"
shadow_tarball="shadow-${shadow_version}.tar.xz"

systemd_version="256.4"
systemd_dnl="https://github.com/systemd/systemd/archive/v${systemd_version}/systemd-${systemd_version}.tar.gz"
systemd_sha256="7861d544190f938cac1b242624d78c96fe2ebbc7b72f86166e88b50451c6fa58"
systemd_tarball="systemd-${systemd_version}.tar.gz"

systemd_man_dnl="https://anduin.linuxfromscratch.org/LFS/systemd-man-pages-${systemd_version}.tar.xz"
systemd_man_sha256="dceb4cc699b3801c38d99f88618ca7e7f7e23ee6016a8b7eef3ed361d852d340"
systemd_man_tarball="systemd-man-pages-${systemd_version}.tar.xz"

tar_version="1.35"
tar_dnl="https://ftp.gnu.org/gnu/tar/tar-${tar_version}.tar.xz"
tar_sha256="4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16"
tar_tarball="tar-${tar_version}.tar.xz"

tcl_version="8.6.14"
tcl_dnl="https://downloads.sourceforge.net/tcl/tcl${tcl_version}-src.tar.gz"
tcl_sha256="5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66"
tcl_tarball="tcl${tcl_version}-src.tar.gz"

tcl_doc_dnl="https://downloads.sourceforge.net/tcl/tcl${tcl_version}-html.tar.gz"
tcl_doc_sha256="bfd319033beeeead986f46be0a3a3ef6ee35424770f7836dca45bbc0ba27ee5f"
tcl_doc_tarball="tcl${tcl_version}-html.tar.gz"

texinfo_version="7.1"
texinfo_dnl="https://ftp.gnu.org/gnu/texinfo/texinfo-${texinfo_version}.tar.xz"
texinfo_sha256="deeec9f19f159e046fdf8ad22231981806dac332cc372f1c763504ad82b30953"
texinfo_tarball="texinfo-${texinfo_version}.tar.xz"

tzdata_version="2024b"
tzdata_dnl="https://www.iana.org/time-zones/repository/releases/tzdata${tzdata_version}.tar.gz"
tzdata_sha256="70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
tzdata_tarball="tzdata${tzdata_version}.tar.gz"

util_linux_series="2.40"
util_linux_version="${util_linux_series}.2"
util_linux_dnl="https://www.kernel.org/pub/linux/utils/util-linux/v${util_linux_series}/util-linux-${util_linux_version}.tar.xz"
util_linux_sha256="d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
util_linux_tarball="util-linux-${util_linux_version}.tar.xz"

vim_version="9.1.0774"
vim_dnl="https://github.com/vim/vim/archive/refs/tags/v${vim_version}.tar.gz"
vim_sha256="2bbf5cfcd4210330a0edc7d11ac18ff3f8e78cf0ff26e0d03a52ce2e04d2c9b8"
vim_tarball="v${vim_version}.tar.gz"

wheel_version="0.44.0"
wheel_dnl="https://pypi.org/packages/source/w/wheel/wheel-${wheel_version}.tar.gz"
wheel_sha256="a29c3f2817e95ab89aa4660681ad547c0e9547f20e75b0562fe7723c9a2a9d49"
wheel_tarball="wheel-${wheel_version}.tar.gz"

xml_parser_version="2.47"
xml_parser_dnl="https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-${xml_parser_version}.tar.gz"
xml_parser_sha256="ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8"
xml_parser_tarball="XML-Parser-${xml_parser_version}.tar.gz"

xz_version="5.6.3"
xz_dnl="https://github.com//tukaani-project/xz/releases/download/v${xz_version}/xz-${xz_version}.tar.xz"
xz_sha256="db0590629b6f0fa36e74aea5f9731dc6f8df068ce7b7bafa45301832a5eebc3a"
xz_tarball="xz-${xz_version}.tar.xz"

zlib_version="1.3.1"
zlib_dnl="https://zlib.net/fossils/zlib-${zlib_version}.tar.gz"
zlib_sha256="9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
zlib_tarball="zlib-${zlib_version}.tar.gz"

zstd_version="1.5.6"
zstd_dnl="https://github.com/facebook/zstd/releases/download/v${zstd_version}/zstd-${zstd_version}.tar.gz"
zstd_sha256="8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1"
zstd_tarball="zstd-${zstd_version}.tar.gz"

# Essentials from BLFS etc.

systemd_units_version="20240916"
systemd_units_dnl="https://www.linuxfromscratch.org/blfs/downloads/systemd/blfs-systemd-units-${systemd_units_version}.tar.xz"
systemd_units_sha256="2ead4a17f00cf0d3f338fa4a055cd46e2609b2326615bc2f901c09572e37b65d"
systemd_units_tarball="blfs-systemd-units-${systemd_units_version}.tar.xz"

gpm_version="1.20.7"
gpm_dnl="https://anduin.linuxfromscratch.org/BLFS/gpm/gpm-${gpm_version}.tar.bz2"
gpm_sha256="f011b7dc7afb824e0a017b89b7300514e772853ece7fc4ee640310889411a48d"
gpm_tarball="gpm-${gpm_version}.tar.bz2"

gpm_patch_dnl="https://www.linuxfromscratch.org/patches/blfs/svn/gpm-${gpm_version}-consolidated-1.patch"
gpm_patch_sha256="3659543dc3c9074f768f80c32a9e9aa1773f147068c49cf7f560ff73a0674524"
gpm_patch_file="gpm-${gpm_version}-consolidated-1.patch"

libunistring_version="1.2"
libunistring_dnl="https://ftp.gnu.org/gnu/libunistring/libunistring-${libunistring_version}.tar.xz"
libunistring_sha256="632bd65ed74a881ca8a0309a1001c428bd1cbd5cd7ddbf8cedcd2e65f4dcdc44"
libunistring_tarball="libunistring-${libunistring_version}.tar.xz"

libidn2_version="2.3.7"
libidn2_dnl="https://ftp.gnu.org/gnu/libidn/libidn2-2.3.7.tar.gz"
libidn2_sha256="4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64"
libidn2_tarball="libidn2-${libidn2_version}.tar.gz"

libpsl_version="0.21.5"
libpsl_dnl="https://github.com/rockdaboot/libpsl/releases/download/${libpsl_version}/libpsl-${libpsl_version}.tar.gz"
libpsl_sha256="1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208"
libpsl_tarball="libpsl-${libpsl_version}.tar.gz"

wget_version="1.24.5"
wget_dnl="https://ftp.gnu.org/gnu/wget/wget-${wget_version}.tar.gz"
wget_sha256="fa2dc35bab5184ecbc46a9ef83def2aaaa3f4c9f3c97d4bd19dcb07d4da637de"
wget_tarball="wget-${wget_version}.tar.gz"

curl_version="8.10.1"
curl_dnl="https://curl.se/download/curl-${curl_version}.tar.xz"
curl_sha256="73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee"
curl_tarball="curl-${curl_version}.tar.xz"

libtasn1_version="4.19.0"
libtasn1_dnl="https://ftp.gnu.org/gnu/libtasn1/libtasn1-${libtasn1_version}.tar.gz"
libtasn1_sha256="1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a"
libtasn1_tarball="libtasn1-${libtasn1_version}.tar.gz"

p11kit_version="0.25.5"
p11kit_dnl="https://github.com/p11-glue/p11-kit/releases/download/${p11kit_version}/p11-kit-${p11kit_version}.tar.xz"
p11kit_sha256="04d0a86450cdb1be018f26af6699857171a188ac6d5b8c90786a60854e1198e5"
p11kit_tarball="p11-kit-${p11kit_version}.tar.xz"

makeca_version="1.14"
makeca_dnl="https://github.com/lfs-book/make-ca/archive/v${makeca_version}/make-ca-${makeca_version}.tar.gz"
makeca_sha256="6391698fe6db16eb190da1aba802bc90c09c8baa4c116d9c65647bea87f190db"
makeca_tarball="make-ca-${makeca_version}.tar.gz"

# Other

linux_firmware_version="20240909"
linux_firmware_dnl="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-${linux_firmware_version}.tar.gz"
linux_firmware_sha256="93e9b6ae2240661639c874f5fc38f677d18afe365b17a13fee6b4fc4fba42c10"
linux_firmware_tarball="linux-firmware-${linux_firmware_version}.tar.gz"

# EOF
