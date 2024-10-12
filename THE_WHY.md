The Why
=======

This is a lot of blabbering. Blabbering and then reading my own blabbering
later helps clarify my thoughts.

Well, this is at least a partial explanation at *why* I am attempting to create
my own GNU/Linux distribution.

I have become less and less fond of the current GNU/Linux distribution
landscape. It seems that each distribution has a specific way of doing things
and you do it their way or do not do it at all. Each distribution likes to
package everything under the sun and you use their packages or you build from
source.

I have a different philosophy. I do not like monopoly power. I do not like the
power that Amazon has, I do not like the power that Facebook has, I do not like
the power that Chase has. I think diversity in options is key to consumer
quality.

It is true that there are many different GNU/Linux distributions to choose from
but it seems that each one is trying to be a monopoly power and dictate how
things are to be done.


The KISS Philosophy
-------------------

There is an old GNU joke that (according to my father) predates the Linux kernel
considerably: ‘Less is more, more or less.’

The joke is a pun on the console pager `less` which was written as a GNU
alternative to the standard UNIX pager `more`. I *personally* like that pun
because it embodies the philosophy of KISS---‘Keep It Simple, Silly!’

The base distribution should be simple with added features needed for more
advanced use cases available but nor forced upon everyone just to have them.


### Linux-PAM

Linux-PAM. It is required by the LSB (Linux Standards Base). Fuck the LSB! When
I say that, I do not mean the LSB should just be wantonly ignored, I actually
frequently refer to it. However, things like requiring Linux-PAM and the RPM
Package Manager are just bullshit aspects of the LSB. Even things like requiring
the Qt4 Libraries be available are bullshit aspects of the LSB.

In corporate environments, it probably is critical to have Linux-PAM. For the
home user, we typically only ever authenticate by either a standard password or
by SSH keys if connecting remotely (SSH keys do not require PAM). We really
should not even have Linux-PAM loaded but with virtually every GNU/Linux
distribution out there, Linux-PAM is installed and the `shadow` package is
linked against it. The LSB requires it.

There have been more than one occasion where vulnerabilities in PAM allow for
__REMOTE__ access to the system. Often those vulnerabilities require special
circumstances that necessitate another attack first, but when that happens (e.g.
via malware) systems were vulnerable to the remote attack because of a flaw in
Linux-PAM that many users did not even need to have.

Most home systems are behind a router and thus not accessible to a remote attack
unless the attacker has a way onto the home network, but IPv6 is changing that.

Earlier this year, we tried a 5G router to see if it would meet our needs as the
monthly cost was much lower. I plugged the WLAN port from my home network router
(Omada controlled ER605v2) into the single Ethernet jack on the 5G router, and
it worked. Not only did it work, but my GNU/Linux desktops were now able to grab
IPv6 addresses! The geek in me thought that was cool, until (and it did not take
long) port scans started coming in.

Many home network routers, including the TPLink Omada hardware, just are not
ready for IPv6. They support it but do not have the firewall capabilities, you
have to run a separate firewall.

In our case, 5G just did not work out. Extensive bandwidth testing showed we
would have brief periods with over 200 MBit (very adequate for a home network)
followed by long periods with less than 30 MBit. I suspect the service just had
more subscribers than their hardware could adequately support.

However there are many people now using 5G for home networks who either do not
have adequate IPv6 firewall technology or do not know that they should turn off
IPv6 support and just use IPv4 with NAT for their home network. Such systems
would potentially have __remote__ vulnerability to future (or present secret
zero-day) exploits in Linux-PAM. Such systems would __NOT__ be vulnerable to
Linux-PAM exploits if they did not use Linux-PAM.

Linux-PAM is absolutely the right solution in some corporate environments but it
should be provided by add-on package repositories rather than forced upon all
the users when the vast majority of home users will __NEVER__ use its
capabilities. Keep It Simple, Silly! Less is More!

Those who need (or want) Linux-PAM in YJL can get it from a third-party package
repository, if it *really* is important enough for a third-party package
repository to provide it.

As far as I know, Slackware was the only mainstream GNU/Linux distribution that
did not force Linux-PAM on its users and I suspect the LSB is why virtually
every distribution did force it on its users instead of making it an optional
component to be installed when actually needed.


### Filesystems

Logical Volumes are an awesome technology *however* their use can complicate
things when there is a system failure and recovery is needed. LVM2 is absolutely
the right technology for the server room where one filesystem often spans across
multiple physical drives.

For the home user and even for the corporate workstation, I really do not see
the need for it and prefer the simplicity of not having it.

Even where LVM2 does make sense, where it makes sense is for partitions that
need to use large amounts of data. That is not the root `/` filesystem that the
operating system lives on, but is typically `/home` or `/srv` or something
similar.

LVM2 can be added from a third-party package repository by those who really need
it (or just want it), it does not need to be there from the start.

Most GNU/Linux distributions do in fact allow the user to opt-out of LVM2 but
there still are often filesystem issues because the GNU/Linux distributions
frequently patch `e2fsprogs` to provide features that are not standard which
then make it difficult to mount the partition on a different GNU/Linux system
for recovery. I have run into this issue several times in the past.

Only vanilla `e2fsprogs` should be used in the distribution installer and even
then, bleeding edge features should be disabled by default (for example, the
`metadata_csum_seed` feature in current `ext4`).

If bleeding edge features are *truly* needed, the user can manually enable them.
If non-standard filesystem features are *truly* needed, they can be provided by
a patched `e2fsprogs` package in a third-party package repository. The base
package repository used for the operating system install should only have a
vanilla `e2fsprogs` and care should be taken not use features new enough by
default that a lot of utilities ‘in the wild’ do not yet support it.

I still cringe when remembering that time I had to recover a Red Hat system and
even the *latest* version of `e2fsprogs` could not mount it without first
applying Red Hat’s custom patch.

KISS definitely needs to apply to `e2fsprogs` at the base distribution level.
Fancy filesystem stuff should only be done by those who understand how to deal
with things that go wrong, and that often is not the home user. Even those who
work in IT often *and rightfully* bitch at non-standard options used by some
GNU/Linux distributions *by default*.

I do think that it less of a problem than it used to be, but I do not understand
how it was allowed to be a problem in the first place. It almost feels like they
were looking for ways to lock users in---and that goes against everything that
Free Software stands for.


### Desktop Environments

You can tell someone is potentially subject to authoritarian leanings when they
cite the plethora of desktop environments for GNU/Linux as a downside to
GNU/Linux. The plethora of desktop environments available is important and is
one of the areas where GNU/Linux really shines!

Neurodiversity in our species is a *good* thing. There is no such thing as a
desktop environment that is best for everyone, we all have different ways in
which our mind works and differences in desktop environments allows us to find
one that works better for our way of thinking rather than be forced into the
corporate conformity of a single way of doing things.

It is my philosophy that a GNU/Linux distribution should provide a stable,
mature desktop environment that runs well on modest older hardware and __ALSO__
provide for the vast diversity that exists in the Desktop Environment world.

XFCE is a stable, mature desktop environment that runs well on modest older
hardware and that is why XFCE is the desktop environment that YJL will package
in the base repository.

Even if maintained by the distribution, additional Desktop Environments should
be packaged in their own separate package repositories to avoid cluttering up
software package installers with too many options---especially when many of
those options are designed for Desktop Environments that the user is not even
running.

Another reason why the additional Desktop Environments should have their own
package repositories is that sometimes for generic libraries the Desktop
Environment uses, there are compile-time options or even library version issues
that are specific to that Desktop Environment. In such cases, the package
repository can package the dependency for use with the Desktop Environment
without imposing those compile-time options or version restrictions on the rest
of the GNU/Linux distribution.

When I first started using GNU/Linux, I used WindowMaker. When GNOME 0.8 Beta
was released, I switched to it and quickly became a ‘GNOME Fan Boy’. However
when GNOME3 was released---I hated it. Just to even get it *partially* usable I
had to create custom `.css` files. It felt like they were trying to force a
tablet user interface down my throat. Some people love GNOME3 and more power to
them, it just is not for me. Fortunately MATE gave me alternative, being a clone
of GNOME2.

YJL will have a package repository for MATE.

I have personal doubts I will ever get to the point of a working RPM based
installer. If I do, I have personal doubts I will ever find even 50 users who
are not relatives.

The hope however is that there will be enough users that both demand and capable
maintainers exist at least for GNOME3 and KDE but I would absolutely __LOVE__ to
see many of the lesser-used Desktop Environments have package repositories
available for YJL.


### Fonts

In my opinion, fonts in most GNU/Linux distributions are a mess. The problem is
there are far too many installed, making it difficult from a UI perspective to
select a font. Less is more.

Back when the Apple Macintosh first shipped, there was a small collection of
high quality variable-width bitmap fonts. The ‘Desktop Publishing’ era had
begun. Adobe soon released the PostScript vector font format and a standard
collection of high quality variable-width vector fonts. The ‘Desktop Publishing’
era took off at light speed.

The original collection of standard PostScript fonts was soon expanded to what
became known as ‘PostScript Level II’ with 35 fonts that any author knew would
be available in a ‘PostScript Level II’ printer. The ‘Desktop Publishing’ era
had matured.

If you take a look at the ‘PostScript Level III’ specification that followed, it
contains way too much and shows what happens when KISS is abandoned. That
specification is a joke. Way too many fonts in that specification, no one took
it seriously. Many of the fonts are beautiful fonts that people used, but so are
many fonts *not* in the specification.

For those familiar with the LaTeX world, the TeX-Gyre collection of fonts is a
high quality collection of Latin-based glyphs that covers *most* of the same
typefaces provided by the ‘PostScript Level II’ specification. Note that they
are not metric compatible, but (with the exception of Symbol and ITC Zapf
Dingbats) they provide the same typeface designs. They also provide matching
Unicode Math Fonts.

YJL will ship with the TeX Gyre collection of fonts, supplemented by a font I am
working on called ‘Platillo’ to cover non-script glyphs.

Additional fonts of course will be available. There are a lot of high quality
free fonts out there: Intel ClearSans, Linux Libertine, and many many more.

I do want YJL to provide a package repository specifically for packaged fonts
and if YJL takes off to become a distribution used by more than a handful of
people, I want YJL to work with independent font foundries to make it easy for
users to buy fonts created by those independent font foundries.

The large commercial font foundries can kiss my ass, they want to profit from
the subscription model where you have to pay them every month and if something
happens where the payment is not made, they have bots that look to see if you
are still using the fonts and then they sue you knowing that if you had trouble
paying the subscription fee, you probably can not afford a lawyer. I hate what
the commercial font market has become but I also want very creative people who
design fonts to be able to sell their fonts, a LOT of work goes into creating a
quality font.

When the ‘Desktop Publishing’ era was new, font licensing was much friendlier to
the consumer than it is now. I want YJL to help restore that.

Obviously if a software application *depends* on a specific font, that font will
need to provided. In most cases, the issue is actually codepoint coverage rather
than specific font files.

#### Google Noto

The TeX Gyre collection is fantastic (IMHO) for Latin based languages. However
YJL *probably* will also ship the Google Noto fonts to cover other scripts.

As the user base grows to include users of non-Latin based scripts, quality
collections of fonts for those scripts that serve the same purpose as TeX Gyre
for Latin based scripts will need to be provided.

Google Noto fonts will provide decent coverage but probably are not the best
collection of fonts for many scripts out there.


To Be Researched
----------------

A lot of hardware, especially modern hardware, requires binary blobs to properly
function. These binary blobs can often be found in the Linux Firmware git at:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

As they are binary blobs, they can not be shipped as part of a Linux kernel
package because of the GPL but they can be shipped as part of a separate package
and then loaded by the kernel while the kernel is booting.

Loading them by the kernel while the kernel is booting generally requires that
they be placed into an `initrd` image that the `grub` boot loader knows about.

BLFS has a really good write-up on this in Chapter 3 but I need to do a lot more
research on the topic *especially* since the proper way to handle it may depend
specifically on the hardware that needs the blob loaded.


Controversial Design Decisions
------------------------------

At least I *think* these are controversial design decisions...

### Ease of Use

Ease of Use is not my biggest concern. Not everything needs a GUI tool, I do not
think it is a problem for the user to be expected to know how to use a text
editor from a console to perform some configuration tasks.

I am certainly not opposed to configuration tools that are properly written but
for example, I do not have a problem with manual creation of the files in the
`/etc/systemd/network` directory being necessary in order for networking to
work.

Operating systems used to come with a printed manual. Was that really so bad?

### SELinux

YJL will not support SELinux. SELinux support is really the kind of thing that
needs to be available at system installation rather than provided by an add-on
package repository.

My *personal* experience with SELinux is that it gets in the way of the user and
adds too much complexity to system administration. It may be necessary for the
Enterprise user, but the benefit just does not justify the added work for the
desktop user.

### 32-bit Compatibility

YJL is for 64-bit `x86_64` systems. The base operating system will not provide
any 32-bit libraries.

It *hopefully* will be possible to cross-compile 32-bit libraries to install
into somewhere like `/opt/32-bit` so that things like the Second Life
‘Firestorm’ client viewer can run on it, but the operating system is __NOT__
being built with 32-bit compatibility in mind. Of course it would be even better
if applications like Firestorm were ported to 64-bit.

### FireFox

This will likely be a show-stopper for many. I have no plans to ever package the
FireFox web browser for YJL. I will provide clear instructions on how to
*safely* install it, but I will not provide a YJL maintained RPM package for it.

An add-on repository can do so if they so choose, but I am very serious about
user privacy and some of the decisions FireFox has made have made me feel like
they are trying to subvert user privacy. Doing things like new options that have
privacy concerns that are opt-out instead of opt-in, etc.

From https://www.pcmag.com/news/firefox-mozilla-data-collection-feature-sparks-privacy-concerns:

> “If you don’t want Firefox to send data about your web activity in this
> manner, you can turn it off.”

Attitudes like that from corporations really tick me off. They should not be
collecting the data in the first place even if they claim to anonymize it, and
when they do collect it, it should be opt-in with the user fully understanding
the potential implications of the data collection.

That article is just but one example. Another example is FireFox defaulting to
DNS over HTTPS by default. See thr section labeled ‘__DNS over HTTPS (DoH)__’
in the file `SECURE_DNS.md` for details.

It is true that YJL could ship a version of FireFox patched to disable those
defaults (or even remove the features completely) but that is a lot of work and
also, the fact that the code is in FireFox and enabled by default to start with
makes me very suspicious of what *else* is in their code that is potentially
harmful to users. I just do not trust them.

YJL will package web browsers, but not FireFox (or Chromium as it seems to me to
be just as bad).

Yes, that means much of the web will not work properly from a YJL provided web
browser.

Web developers who can not figure out how to create web pages that work without
FireFox or Chrome need to look for another job, and GNU/Linux distributions need
to stop enabling companies like FireFox that do creepy things.


Personal History
----------------

Some notes on my history with GNU/Linux.

The first GNU/Linux distribution I ever used was MKLinux DR3 on a PowerPC G3.
For those unaware, MKLinux DR3 was a port of Red Hat 5.1 to the Mach Mikrokernel
by Apple Computer.

Before long I was running LinuxPPC 1999 (a port of Red Hat 6) and it was on
LinuxPPC 1999 that I first did the LFS Project, LFS 2.0. That is where I learned
the most about GNU/Linux.

Eventually I ended up on `x86` hardware running Red Hat Linux. Life was good.
Red Hat provided a good base and there were several different third party RPM
packagers for software beyond what Red Hat provided. When I say life was good,
of course we will ignore the whole GCC 2.96 debacle...but the third party
package repositories provided GCC 2.95.

And then Fedora happened. Fedora as ‘Fedora Extras’ was a good thing, and it was
not the only option people had to extend software beyond what shipped with Red
Hat. But then Red Hat Linux ceased and became Fedora Core and then Fedora. The
software was always bleeding edge and just when it started to mature and become
stable, it became ‘End of Life’ and us users were forced to install a new
version with new bugs. I hated it. Basically it was not profitable for Red Hat
to produce a consumer distribution so they turned it into a testing ground for
their Enterprise product. To their corporate mindset, us users were nothing more
than free beta testers for what would go into their commercial enterprise
product (RHEL).

I switched to CentOS at that time. The software wasn’t bleeding edge, and it was
stable and it worked. CentOS 5 was my first version of CentOS.

When necessary---such as with Apache, MySQL, and PHP---we could install newer
versions on it either from source or from add-on repositories, but the operating
system itself was solid and stable and well-maintained.

CentOS (developed as a clone of RHEL) was then acquired by Red Hat and CentOS 7
was the last version I felt comfortable with. I simply do not like the direction
that Red Hat has gone with it.

Debian is still a really good choice, I ran it on an m68k system (Apple SE/30 to
be specific) back when I was first learning GNU/Linux but I felt like I just did
not fit into the Debian world. At the time, mail lists were the method of user
support and the mail lists for Debian seemed more hostile to me than they were
in the Red Hat world, I just did not feel welcome.

The issue, my brain works differently. I am not dumb but I do not always
understand explanations people give because my brain works differently. On the
Red Hat related lists, it seems people were more patient when I had trouble
with an explanation but on the Debian lists, I was treated like an imbecile. So
I never felt welcome in the Debian world.

The distribution however is fantastic and the developers are top notch.

At one point I tried Ubuntu. After installing it, I did not see where the GIMP
was installed so I used their search tool thingy to search for it, and I was
sent to an Amazon web page offering me books on The GIMP. Fuck that, I wiped it
and put CentOS on that system that very day.

I later learned that not only was Ubuntu sending my search request to Amazon but
it was doing it without a secure connection. Who the fuck approved that and why
wasn’t that caught in beta testing? It generated enough complaints that they
stopped doing it but I have to wonder when they will try something like that
again. It seems the bigger a company is, the more likely it is that they lose
sight on the importance of user privacy. The consumer becomes the product they
sell to other big companies, and that even happens in the FLOSS world. In the
FLOSS world though we, the users, have the power to do something about it.
Well, in theory we do anyway.

Fast forward several years...

When it was announced that CentOS 7 was ‘End of Life’ I tried the modern Debian,
Fedora, and Ubuntu options. All of them installed on my hardware and all of them
kernel panicked on first boot. LFS works fine, even with modern kernels, so it
seems that the GNU/Linux distributions have something selected in their kernel
that causes a kernel panic but is not used in their installer. I could try to
track it down. I suspect it was a bug in the open source nVidia driver, another
possibility is I needed a firmware update on my motherboard (which I have since
applied) but honestly I think rolling my own GNU/Linux distribution is going to
give me happier results.

LFS is fantastic but package management really does have significant benefits.

Worst case scenario, I am my only user. Would that really be so bad?

My hope is that there are others like me who agree that a small ‘Core’
distribution with user choice in package repositories for software beyond that
‘Core’ is the right way to do things.

Such a philosophy does sometimes result in conflicts between package
repositories but such conflicts can usually be solved without too much work.

Many conflicts between repositories are the result of packaging bugs. Good
documentation can potentially reduce such issues.
