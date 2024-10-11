DNS and Security
================

On traditional GNU/Linux (and most other UNIX and UNIX-like systems), DNS
resolution was accomplished by adding the static IP addresses of at least two
DNS servers is the file `/etc/resolv.conf`. It worked but it lacked any
mechanism for DNS injection attack security.

A DNS injection attack is where the attacker intercepts a query to a DNS server
and responds with their own carefully crafted response that is then accepted,
basically spreading intentional misinformation to deceive the target, kind of
like what Fox News, Newsmax, Elon Musk’s ‘Twitter/X’, and Donald Trump’s ‘Truth
Social’ do. Misinformation is extremely dangerous and when done in the form of
a DNS injection attack it can literally wipe out someone’s bank account and even
lead to someone’s death.

SystemD GNU/Linux now offers a name resolution service called `systemd-resolved`
which (as of SystemD 213) is now enabled by default. That service aims to
provide the necessary tools to help protect a system against DNS injection
attacks.

On social media (especially places like reddit) you will often run into
GNU/Linux users who make the claim that `systemd-resolved` is trying to solve
a problem that has already long been solved by `/etc/resolv.conf` and is an
example of programmers trying to force complexity on us. They will often get a
lot of upvotes and confirming replies. I hate to be condescending but those
people are just fucking idiots who like to sound wise.  DNS injection attacks
are a __SERIOUS__ problem that `/etc/resolv.conf` does not even *begin* to
address.

Perhaps an argument could be made (although not currently by me) that
`systemd-resolved` is not the right solution, but to suggest there is not a
problem that needs solving is just plain ignorant absurdity.

My system configuration scripts in this git repository currently disables the
`systemd-resolved` service and instead uses the less secure `/etc/resolv.conf`
method of DNS resolution. Even though this git is intended for my use, it is
public so I feel *obligated* to both explain why __and__ explain how users can
defend themselves against DNS injection attacks.


Why Disable `systemd-resolved` ??
---------------------------------

The documentation for `systemd-networkd` was easy enough for me to understand
but the documentation for `systemd-resolved` is currently very confusing to me.

Furthermore, it seems that it is only enabled by default on two mainstream
GNU/Linux distributions: Fedora and Ubuntu. In both cases, user support
resources are full of people having problemd with `systemd-networkd` including
very slow responses that are solved when the user disables the services and
instead uses `/etc/resolv.conf` to configure DNS resolution.

I suspect many of the issues are in fact user configuration problems, I find
the documentation difficult to understand. However both Fedora and Ubuntu are
well-known for using their users as unpaid beta testers for technology that is
not yet ready for prime time, so I do suspect some of the issues that users are
having with `systemd-resolved` is a lack of maturity in the service.

Furthermore, the security benefits of `systemd-networkd` over
`/etc/resolv.conf` are the support for DNSSEC and DoT (DNS over TLS, not the
Department of Transportation). Both of those features however are labeled as
experimental and in fact I suspect failures with DoT are at least partially
responsible for the issues some Fedora and Ubuntu users have with
`systemd-networkd`. It would be interesting to see if users with with really
slow DNS resolution have that feature turned on and what happens when they
turn it off. What may be happening is `systemd-networkd` is trying to retrieve
the response over TLS but is having a TLS failure, finally making the request
without TLS once a certain number of failures have occurred.

I would definitely like to play with `systemd-resolved` and figure out how to
properly configure it, but that is something to do after I __know__ the new
system is otherwise stable so that I do not blame `systemd-resolved` for what
it is not to be blamed for.


DNSSEC
------

A DNS response is just a string of data. What DNSSEC does is provide a
cryptographic signature to that string of data that can be used to validate the
integrity of the data.

When an attacker modifies a DNS response, the response will no longer validate
against the DNSSEC signature unless the attacker *also* modifies the signature
but to do that, they need the DNSSEC signing key for the domain.

It is not impossible for an attacker to obtain the DNSSEC signing key for a
domain but it makes a DNS injection much more difficult and when it is
discovered that a DNSSEC signing key has been compromised, it is trivial to
revoke the key so that it is no longer valid and issue a new signing key.

Every DNS client __SHOULD__ validate DNS responses with DNSSEC and every domain
should sign their DNS records with DNSSEC. The signing key should be kept on a
machine that is not connected to a network, with the signed records then
uploaded to the authoritated DNS server for the domain.

Unfortunately many domains do not yet sign their DNS records. Of those that do,
how many of them keep their signing key on an offline machine is a question I
have not seen researched.

If (and when if not currently) `systemd-resolved` with DNSSEC validation works
smoothly and reliably it absolutely should be used in place of
`/etc/resolv.conf` for DNS resolution of a Linux desktop.

Until `systemd-resolved` with DNSSEC validation works smoothly and reliably,
the best solution is to run `unbound` in DNSSEC enforcing mode on your local
GNU/Linux desktop and your `/etc/resolv.conf` file should have the single
entry `nameserver 127.0.0.1` (also add `::1` if you are on an IPv6 network).

The `unbound` daemon has very mature DNSSEC support.


DNS over TLS (DoT)
------------------

DNS over TLS is just like regular DNS except it uses a TLS connection to make
the request and receive the answer.

DoT does offer protection against DNS injection attacks between the client and
the recursive server it queries, but it is important to understand that DoT is
__NOT end to end encryption__. It is still possible for the DNS response to be
modified either on the recursive server the query is made to, or somewhere
between that recursive server and the authoritative DNS server for the domain.

The only way to have high confidence that the answer to your DNS query has not
been modified is through DNSSEC validation.

DoT does provide *partial* protection for cases where the authoritative DNS
server does not use DNSSEC to sign their DNS records (common with dynamic DNS
services for logistical reasons) and it provides a small amount of protection
against someone snooping on your network to see what DNS requests you are
making.

It is my *strong opinion* that when DoT is used, it should only be run as
opportunistic DoT meaning plain text fall-back is used when there is a TLS
problem.

Failure to resolve domain names because of a TLS problem (such as a revoked
certificate, a certificate not trusted by your client’s certificate bundle, or
an inability for your client and the server to agree upon cypher suite to use)
results in a *complete loss* of DNS services unless DoT is used as an
opportunistic feature that allows a fall-back to plain text.

If you are running a caching DNS server on your LAN, using DoT likely will
require either a self-signed certificate that your system is configured to trust,
or a corporate Certificate Authority that signs the certificate that your system
is configured to trust.

Even if and when DoT works well in `systemd-resolved`, I would recommend
against desktop systems being configured to use DoT and if they are configured
to use it, it should be opportunistic so that DNS still works when
there is a TLS problem with the resolver being queried.

For the desktop user who wants the privacy benefits of DoT, I suggest you use a
VPN to achieve those privacy benefits. For the desktop user who fears DNS
injection between their system and the recursive DNS server they make queries
to, DoT can be used but if used, configure it to be opportunistic.

Many networks monitors DNS traffic for suspicious queries that indicate malware
has found its way onto the network. Those networks will often block DoT because
the traffic is encrypted and the queries can not be analyzed for malware
activity. If your system is configured to *only* allow DoT queries, your system
will not work on a network that blocks DoT queries.

Honestly I just recommend desktop systems enforce DNSSEC but should avoid DoT
and only use opportunistic DoT when if they really want to use it at all.

Recursive DNS servers absolutely should use DoT when communicating with the
authoritative DNS servers they query, however, even then it should be
opportunistic. Recursive DNS servers should use DNSSEC to validate the integrity
of the results with DoT as a fall-back to provide some protection, when
available, for cases where the authoritative DNS server does not implement
DNSSEC.


YJL Planned Implementation
--------------------------

When I am confident that `systemd-resolved` works well and smoothly in DNSSEC
enforcing mode, that will be the enabled default. I will *not* enable DoT by
default but users will be told how to enable it in opportunistic mode.

Until `systemd-resolved` works well and smoothly in DNSSEC enforcing mode, I
will disable it by default. Users who want it of course can enable it. I really
do not YJL to be a distribution that pushes technology not quite ready for mass
adoption on its users.

If `systemd-resolved` with DNSSEC support is not yet working well and smoothly
when the first official YJL release happens, then YJL will ship with `unbound`
configured for DNSSEC and opportunistic DoT queries to the authoritative DNS
servers, but the user will have to enable the service if they want it as I do
no like installing running servers by default.


DNS over HTTPS (DoH)
--------------------

foo