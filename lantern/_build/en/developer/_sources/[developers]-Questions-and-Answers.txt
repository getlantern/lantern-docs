====================================
Questions and Answers for Developers
====================================

Does Lantern work with other circumvention tools?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Running Lantern in Get Access mode may not work with other tools such as
VPN software running at the same time. However, it should have no
problem running at the same time as tools like the Tor Browser Bundle,
which only affect their own connectivity, rather than all programs
running on the computer. By default, Lantern in Get Access mode sets
itself as your system proxy, so that all browsers running on the system
will just use it automatically. So this is incompatible with other tools
that expect to modify system-wide connectivity too. Lantern can be
configured to not set itself as the system proxy (requiring you to
specifically configure your browser to use it) under advanced settings.

What type of encryption does Lantern use?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lantern uses the following cipher suite for all connections between
peers: TLS\_ECDHE\_RSA\_WITH\_AES\_256\_CBC\_SHA. That is, we use
elliptical curve because of its shorter key lengths along with ephemeral
Diffie-Hellman key exchange to preserve forward secrecy. We then use AES
256 in CBC block cipher mode instead of stream ciphers such as RC4 due
to the greater number of known attacks on RC4.

What about certificates? Isn't Lantern vulnerable to man-in-the-middle attacks, especially with forged signing certificates from compromised certificate authorities?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, Lantern connects to Google Talk servers over TLS. Lantern embeds
the Google Talk signing certificate in its install and only trusts that
certificate and a handful of others as trusted certificates, a sort of
hard-coded form of certificate pinning. Lantern's connections between
peers use self-signed certificates that are exchanged over XMPP through
that trusted Google Talk connection. Lantern then only allows
connections with those trusted certificates, thwarting any possible
man-in-the-middle attack.

Why does Lantern require a Google login? What happens with the generated OAuth tokens?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lantern requires users to log in to Google for the following reasons:

1. It allows you to easily connect with your existing Google Talk
   contacts via Lantern in order to bootstrap the trust network
2. It allows Lantern to use Google's XMPP servers to negotiate direct
   P2P connections between users
3. Google Talk is also largely unblocked, so it provides a channel
   through which Lantern can usually communicate

When you log in to Google via OAuth, Lantern stores your OAuth refresh
token on your local computer in an encrypted form using your operating
system's keychain.

What if Google Talk is blocked?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If Google Talk is blocked, Lantern detects this and starts to tunnel
access to Google Talk through fallback proxies. Those proxies are also
distributed through the Lantern trust network using Kaleidoscope to keep
them from being enumerated and blocked. Those proxies are also used in
cases where no peers are available.

How does Lantern distribute information about proxies?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lantern uses an algorithm called Kaleidoscope to distribute information
about proxies. More information is available at Lantern's separate
Kaleidoscope library implementation
`here <https://github.com/getlantern/kaleidoscope>`__. The core idea
behind Kaleidoscope is to distribute information through a trust network
in a limited manner such that no single actor on the trust network can
enumerate all information distributed even if the trust network is
compromised.

How will running Lantern affect performance on my computer?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lantern's goal is to be as lightweight and unobtrusive as possible. In
Get Access mode, besides being able to access previously blocked sites,
you shouldn't even notice it's running. In Give Access mode, a portion
of your internet connection will be intermittently donated to other
users, but based on the other users online at the time, you may not even
notice. We plan to intelligently limit the resources Lantern consumes
while you're using your computer in the future (see
`#19 <https://github.com/getlantern/lantern/issues/19>`__).

How does Lantern use reliable UDP?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lantern makes use of UDP to cross NATs and firewall. We then use those
NAT/firewall traversed connections to send
`UDT <http://udt.sourceforge.net/>`__ data. Lantern runs true TLS
directly on top of that UDT layer.

How can I contribute?
~~~~~~~~~~~~~~~~~~~~~~

Please see the :Doc:`Contributing` page.