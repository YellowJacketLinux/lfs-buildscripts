The Why
=======

Well, this is at least a partial explanation at *why* I am attempting to create
my own GNU/Linux distribution.

I have less and less fond of the current GNU/Linux distribution landscape. It
seems that each distribution has a specific way of doing things and you do it
their way or do not do it at all. Each distribution likes to package everything
under the sun and you use their packages or you build from source.

I have a different philosophy. I do not like monopoly power. I do not like the
power that Amazon has, I do not like the power that Facebook has, I do not like
the power that Chase has, I think diversity in options is key to consumer
quality.

It is true that there are many different GNU/Linux distributions to choose from
but it seems that each one is trying to be a monopoly power and dictate how
things are to be done.

The first GNU/Linux distribution I ever used was MKLinux DR3 on a PowerPC G3.
For those unaware, MKLinux DR3 was a port of Red Hat 5.1 to the Mach Mikrokernel
by Apple Computer.

Before long I was running LinuxPPC 1999 (a port of Red Hat 6) and it was on
LinuxPPC 1999 that I first did the LFS Project, LFS 2.0. That is where I learned
the most about GNU/Linux.

Eventually I ended up on 'x86' hardware running Red Hat Linux. Life was good.
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
that free beta testers for what would go into their commercial enterprise
product (RHEL).

I switched to CentOS at that time. The software wasn’t bleeding edge, but it was
stable and it worked. CentOS 5 was my first version of CentOS.

When necessary---such as with Apache, MySQL, and PHP---we could install newer
versions on it either from source or from add-on repositories, but the operating
system itself was solid and stable and well-maintained.

CentOS (developed as a clone of RHEL) became aquired by Red Hat and CentOS 7 was
the last version I felt comfortable with. I simply do not like the direction
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
I never felt welcome in the Debian world. The distribution however is fantastic.

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
track it down, I suspect it was a bug in the open source nVidia driver, but
honestly I think rolling my own GNU/Linux distribution is going to give me
happier results.

Worst case scenario, I am my only user. Would that really be so bad?

My hope is that there are others like me who agree that a small ‘Core’
distribution with user choice in package repositories for software beyond that
‘Core’ is the right way to do things.

Such a philosophy does sometimes result in conflicts between package
repositories but such conflicts can usually be solved without too much work.


