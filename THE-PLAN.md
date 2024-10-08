The Plan
========

This is an attempt to create a new GNU/Linux distribution. The why I will
document elsewhere.

The new distribution will be called ‘Yellow-Jacket GNU/Linux’ (abbreviated as
‘YJL’) and will be heavily based upon ‘Linux From Scratch’ (LFS) but will have
many influences from my years with Red Hat Linux, including use of RPM as the
package manager.

I first started this in early 2023 however my efforts were cut short by a busted
water pipe in the ceiling over my bedroom, which also is my office. Extensive
water damage resulted.

After that, there were some medical issues with family members that took a lot
of my time and *still* take a lot of my time, but I am back on track.

Initially, YJL was going to use SystemV Init and the LFS I built in early 2023
is a SystemV Init system. However I am now convinced that SystemD is the better
way to go even though I really like the simplicity of SystemV Init.


Phase One: LFS Bootstrap
------------------------

This phase is what this git repository is about. Create the needed shell scripts
to build the current SystemD LFS (12.2 as I type) on a USB thumb drive that can
then boot an 'x86_64' system and rebuild itself to the hard drive of that
system. It does not need to be able to make a network connection, the needed
source tarballs and patches and scripts will be preserved in '/home/lfs' on the
bootable USB thumb drive.

I am hoping a 128 GB thumb drive will be enough.

My build host is the LFS 11.3 system I build in 2023 (fortunately my PC did
survive the water damage). As of today (2024-11-07) I have LFS 12.2 properly
building through Chapter 8 with my minor modifications (e.g. LibreSSL) but
the build scripts do need some work still and stripping binaries etc. still
needs to be scripted.

I am using '/mnt/newlfs' as the install path rather than '/mnt/lfs' because I
do not want someone playing with these scripts to accidentally nuke their own
LFS system.

If someone stumbles upon this repository, do not use it to learn about LFS.
Do the LFS project from the LFS book. These scripts are for my automation of
my way of doing things which are not necessarily the best way build an LFS
system to learn about GNU/Linux.


Phase Two: GCC Bootstrap
------------------------

The GCC built by LFS does not support building the Ada or D compilers. Both of
those compilers are useful on a GNU/Linux system.

Once I have a hard-disk install booting, the very first order of business is to
rebuild GCC for full compiler support.

To compile GCC with Ada and D support, a working Ada and D compiler is needed.

My LFS 11.3 system has those. What I did back then, on CentOS 7.9 (my build host
for LFS 11.3) I built GCC 7.5.0 with Ada ('gnat') and D ('gdc') support, with an
install prefix of '/opt/gcc750'. GCC 7.5.0 was the newest GCC I could get to
build in CentOS 7.9 with Ada and D support.

I had to copy a few shared libraries from the CentOS 7 system into
'/opt/gcc750/lib' but once I did that, I was able to use that GCC in LFS 11.3 to
then build an Ada and D capable GCC 10.4.0 within '/opt/gcc1040', GCC 7.5.0
would not succesfully build an Ada and D capable GCC 12.2.0.

However I was then able to use GCC 10.4.0 to build the Ada and D capable GCC
12.2.0 which is the GCC version in LFS 11.3.

For the LFS 12.2 GCC bootstrap, I *suspect* I can use the Ada and D capable GCC
GCC 12.2.0 in LFS 11.3 to build an Ada and D capable GCC 14.2.0 installed in
'/opt/gcc1420' that I can then use in LFS 12.2 to bootstrap the system GCC, of
course running the full test suite before installing.

I tried adding Ada and D support to the GCC building of LFS 12.2 Chapter 5 and
it caused a build failure, so it is *possible* I will need another intemediary.

Anyway, boostrapping an Ada and D capable GCC within LFS 12.2 will be my first
priority once it is booting.


Phase Three: RPM Bootstrap
--------------------------

The needed libraries to build RPM will need to be built and installed, and then
RPM will be built and installed.

Once RPM is built and installed comes the long and tedious task of writing the
needed RPM spec files to rebuild every package on the system in RPM. Much of
that work has already been done from my LFS 11.3 system but the spec files need
to be updated and some still needed to be written when the water pipe broke.


Phase Four: XFCE
----------------

Once the system is RPM bootstrapped, I can start building the software needed
for the XFCE desktop environment.

My *personal* preferred desktop environment is actually MATE but XFCE is what I
am building as the default desktop environment for YJL.


Phase Five: Installer
---------------------

With XFCE running, an bootable USB thumb drive that can install the system from
RPM packages will have the be created. That will be when YJL becomes a reality
and not just a concept I am working towards.


Beyond YJL
----------

I really dislike the current GNU/Linux ecosystems where a distribution tries to
package everything under the sun.

I much preferred the older days, pre Fedora, when 'yum' was new and you could
install Red Hat Linux and then use add-on package repositories that met your
specific needs.

YJL will be kept small with a boring LTS kernel, the idea is that those who want
something different than my *personal* vision can build package repositories
that meet *their* vision and needs.

Maybe there could be a small package repository with software suited for running
a Mastodon server. Maybe there could be a small package repository with software
suited for running a video streaming service. Maybe there could be a small
package repository with software suited for running a competitor to Overleaf
that actually uses a current TeXLive backend.

I will probably maintain a package repository for MATE. I have no desire to
*personally* maintain one for GNOME or KDE or whatever but if there are people
who do have such a desire, they can run those repositories even with the freedom
to have their repositories *replace* YJL packages as needed.


YJL Kernel Philosophy
---------------------

Back when I first started using GNU/Linux, it was fun to always run the latest
kernel. In fact, I would run the ‘Alan Cox’ patch to the 2.4 series.

Benefits to running the bleeding edge kernel now do not seem as apparent to me
and maybe they were only imagined back then.

I am not a kernel hacker and even if the YJL project takes off, hiring a kernel
hacker does not seem like a wise use of resources. By running a LTS kernel in
YJL, security issues can be fixed by updating to the latest in the LTS series
from 'kernel.org' without needing to backport patches. Using an LTS kernel means
that YJL does not have to hire a kernel hacker to remain secure without needing
to break some systems with a kernel update when a particular kernel series is
no longer maintained, the LTS kernels are maintained for a very long time.

Users who want a newer kernel are absolutely free to build one and I am sure
that many will, but then compatibility issues are their issue, not the issue of
YJL.

Some examples of where this is an issue: I had a system in a room without a
wired network jack. I went and bought a PCI WiFi card with a Tux logo on it that
claimed Linux compatibility. Well, that was only partially true.

The card required a closed source driver that worked just fine with older
kernels. In fact for CentOS, 'elrepo' had a package for it, but I could not get
the card to work in Fedora because the kernel was too new. I also had a similar
issue with an nVidia GPU.

Using an LTS kernel does not guarantee that such hardware will work however when
the hardware does work with the kernel, it it likely to continue working with
updates to the same LTS kernel series.

Users and add-on package repositories are of course free to package kernels from
newer series but then what to do when 'kernel.org' stop pushing updates to that
series is their problem, not mine. They can backport fixes, or they can update
to an even newer series, but doing the latter may break some systems.

I actually encourage people to build their own kernels using a kernel
configuration that is well-suited for their specific hardware, and of course
many users will decide to do so using a newer kernel series. The LTS kernel that
ships with YJL should be a safe generic kernel configuration but the user need
not be restricted to those options.

I would like YJL to have a tool that allows users to specify what kernel series
they would like to use that then monitors 'kernel.org' for updates to that
series and then creates a 'src.rpm' for them (using 'make oldconfig') that they
can rebuild and install. Sometimes updates have new options so it can not be
totally automated. Of course such a tool would need to verify the signature of
the updated source.

### YJL Versioning

YJL itself will only ship a LTS kernel and the series shipped will be used as
the version number of YJL. For example, the current LTS kernel I am using is
the 6.6 series so if I shipped YJL today, it would be YJL 6.6.

If this project does take off, it is probable that I will not ship a new
version of YJL every time 'kernel.org' tags a new kernel series as an LTS
series. There is a good chance I will only make a new YJL for every other LTS
kernel.

The 6.6 series was initially released in October, 2023 and has a projected EOL
of December, 2026. My guess is there will be another LTS series before I have an
installer ready, and that it will likely also have about a three year lifespan.

My guess is that the initial installer will probably have kernel configuration
that needs a lot of improvement. Updated installers with updated packages are a
sure thing. A hyphen can be users for that, e.g. ‘YJL 6.6-3’ would indicate the
third installer revision of YJL that uses the 6.6 LTS kernel series.


TeXLive Philosophy
------------------

I am an avid LaTeX user, since the days of teTeX before TeXLive was a thing. I
hate distribution packaging of TeXLive.

If someone wants to create an RPM package repository for TeXLive packages, more
power to them. The problems I have is that it really is better to just have all
of CTAN anyway and when you have been using TeXLive for any amount of time, you
likely want to have several versions around.

If I need to tweak a document I made in 2016 using pdfLaTeX from TeXLive 2016,
there is a decent chance it will properly compile in TeXLive 2024 but very often
I find I need to make a lot of changes to it. However if I instead make the
tweak and rebuild it using pdfLaTeX from TeXLive 2016, there very rarely is an
issue. I might port it to LuaLaTeX in a modern TeXLive if I think there will be
more than just a tweak made, but if I just need to tweak it, it is good to have
the old versions available.

TeXLive should be installed in '/opt/texlive/YYYY' where 'YYYY' is the year.
The system should have a user named 'texlive' that has write permission to it,
and that user account can update the install as needed using 'tlmgr' and when a
new version of TeXLive is released, the 'texlive' user can install it without
nuking the older versions.

YJL will provide the shell scripts needed to set this up, YJL will not package
TeXLive. Third parties that want to create an RPM package repository, have at
it, I just think distribution packaging is the wrong approach to TeXLive.










