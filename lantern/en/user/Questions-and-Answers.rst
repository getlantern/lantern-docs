Questions and Answers
=====================


Is Lantern safe for me to use?
-------------------------------

* Lantern IS a tool to provide access.
* Lantern IS NOT an anonymity tool.
* Lantern IS NOT designed to prevent monitoring.

**Only add Lantern friends that you really trust**. If a censor infiltrates the network, they will be able to disrupt traffic and discover the IP addresses of some Lantern users. If you are in a censored region, your internet traffic will run through the computers of the people you are connected with on Lantern. If you add people you donʼt trust, you risk adding a user that could be monitoring you.

**Lantern sends your traffic through peers up to four degrees away from you**. In order to build a more connected and scalable network, your traffic can be sent through friends of friends of friends of friends. We do this because most
users don’t directly know anyone across the censorship divide. Every additional link in the chain exposes
you to a less and less trusted user.

**Use Tor if you want anonimity.** If you don't want sites you visit to have access to your IP address and physical location, or you can't risk network monitors determining what sites you visit, use `Tor <https://www.torproject.org>`__. Tor is great software. We communicate with the Tor team frequently. Again, Lantern’s purpose is access. Tor’s purpose is anonymity.

.. warning:: **DO NOT POST SENSITIVE CONTENT TO SITES HOSTED IN REGIONS WHERE THE GOVERNMENT WILL PURSUE YOU. This applies to any tool, including Lantern or Tor. A global network observer, like the government, can identify you as the person who uploaded the content. They will be able to geolocate you. If you think the content could be controversial in any way, make sure you are posting to sites hosted outside of the country.**

Why should I only add people I trust as friends?
-------------------------------------------------------------------------------------

Anyone giving access on the network can monitor or block traffic that is being proxied through their computer. Anyone that is getting access can post sensitive or private content and it will appear as though the traffic is coming from the computer that is giving access. **Due to these risks, everyone running Lantern should only friend people they trust, and only use Lantern to proxy traffic that is not private or sensitive**.

By only adding people you trust, you protect not only yourself, but also
your friends, their friends, their friendsʼ friends, and so on.

How does the trust network work?
--------------------------------

Lantern is built on a trust network. This network connects people who
trust one another so they can share internet connections. When you and another
user are Lantern friends, you can proxy traffic for each other using Lantern. 

If Lantern proxied only through direct friends, users would often not have proxies available. To mitigate this, Lantern users getting access can discover users giving access that are up to 4 degrees away from them in the trust network. By allowing users to discover users farther away from them in the trust network, Lantern increases available proxies while maintaining blocking resistance.

.. important:: Lantern will never send your traffic through any peer without your explicit approval, regardless of how far away they are in the trust network. **You have to explicitly approve each user who will proxy access for you**. 

How does Lantern work if I can't reach any users giving access?
----------------------------------------------------------------

To help get the Lantern network started, we set up :ref:`lantern-cloud-servers`. These servers handle traffic when no other users are available to give access. Our hope is that we will need less cloud servers as the Lantern network grows.

We also plan to give people an option to sponsor additional cloud servers dedicated for them and their friends. We also hope to partner with companies that have spare computing capacity and want to help internet freedom by donating servers to Lantern.

How does Lantern compare to other tools?
----------------------------------------

Lanternʼs goal is to give users access while being fast, secure, and
easy to use. `Tor <https://www.torproject.org>`__ is one of the most
popular tools in this space with a primary focus on anonymity. 

For those who do not care about complete anonimity, Lantern provides an
alternative with typically faster access. Compared to other tools aimed
at access (GoAgent, Freegate, Ultrasurf, Psiphon, Autoproxy), Lanternʼs
strength is that is can be easily installed and used, as well as
its trusted peer-to-peer network architecture that is designed to scale in the
presence of censors. *The use of real-world trust relationships in
Lantern also makes it extremely resilient to blocking attempts.**

By default, Lantern runs as a system proxy. This means that internet browsers on your machine will use it automatically. You don't have to change any of your computer settings for it to work. Some other tools work only with one specific browser or have complex configurations.

Another unique aspect of Lanternʼs design is its peer-to-peer
architecture, which allows data to come from many computers at once,
rather than a single server. Peer-to-peer architectures also allow
networks to scale to millions of users at a fraction of the cost of more
centralized architectures.

How is Lantern different from uProxy?
-------------------------------------

Recently, the Lantern team has contributed to
`uProxy <https://uproxy.org>`__, a new effort sponsored by Google Ideas.
While there are similarities between the two, there are also some
important differences. 

For one, Lantern is an independent app that stays running in the background, while uProxy is a browser extension, and currently requires asking a single friend to proxy for you on a per-session basis. With Lantern, you can have many peers give you
access at the same time as opposed to just one. 

Another difference is that Lantern allows friends of friends, up to 4 degrees away, to connect to one another. uProxy only allows direct friends. 

Finally, to be faster and more blocking resistant, Lantern provides access
only to a configurable set of sites. uProxy reroutes traffic to all sites through your uProxy peer while you have it enabled.

Why does Lantern not proxy every site by default?
--------------------------------------------------

By default, Lantern only provides access to a list of known blocked
sites. We do this for multiple reasons. 

It is always faster to go to a site directly, rather than through a proxy. Sites that arenʼt blocked will be fastest if they are accessed directly. Another reason is that it frees up Lantern network resources to provide better access to sites that are actually blocked.

How do I download Lantern?
---------------------------

Lantern is still in private beta. You can request an invitation and
updates
`here <https://getlantern.us2.list-manage.com/subscribe/post?u=0ac18298d5d0330dcda8f48aa&id=f06770f311>`__.

I live in an uncensored region and don't know anyone in a censored region. Can I still help?
---------------------------------------------------------------------------------------------

Definitely! People in censored regions can still learn about you through
your friends. So while you donʼt know anyone directly living in censored
regions, your friends might, and the odds are even better that their
friends might, and so on. If you keep Lantern running and keep adding the
people you trust, eventually youʼll be connected with users who need
access. **Thatʼs why itʼs really important to invite your friends to
Lantern**. It maximizes the likelihood that your social network will
reach into censored regions so you can help.

Is a Gmail account required to use Lantern?
-------------------------------------------

Yes. For details, see `Why Does Lantern Require a Google
Login? <https://github.com/getlantern/lantern/wiki/%5Bdevelopers%5D-Questions-and-Answers#-why-does-lantern-require-a-google-login-what-happens-with-the-generated-oauth-tokens>`__.

OK, I've installed Lantern. Now what?
--------------------------------------

For users in uncensored regions, there are two basic things you can do
once youʼve installed Lantern:

1. **Run Lantern as much as possible.**
2. **Add more users you trust as Lantern friends.**

Whenever you run Lantern, you create a new access point users in
censored regions can use to access the open Internet. Remember, though,
that only people in your Lantern network will be able to connect to you.
Thatʼs why the second step is critical. The larger your Lantern network,
the higher the odds youʼll provide access to users who need it. **So
please invite as many trusted contacts as you can!**

How do I upgrade to a newer version of Lantern?
-----------------------------------------------

Please see `Upgrading to a New Version of
Lantern <https://github.com/getlantern/lantern/wiki/Upgrading-to-a-New-Version-of-Lantern>`__.

Will Lantern make my computer vulnerable to hackers?
-----------------------------------------------------

Lantern takes a number of precautions to make sure users are safe.
First, Lantern does not allow anyone it connects you to to read the
contents of your computer. It simply allows you to share Internet
connections. The data passing between you is encrypted so that no
intermediaries (e.g. your government or Internet service provider or
theirs) can read it. Lantern also requires mutual authentication for all
connections, which means that Lantern will only allow users to connect
to you that it can verify are in your Lantern network, and not just
anyone.

Is Lantern free? Will running it cost me anything?
---------------------------------------------------

Lantern is free as in money and as in freedom: free to use, modify, and
redistribute in accordance with its
`license <https://raw.github.com/getlantern/lantern/master/LICENSE>`__.

If your Internet connection is limited, then giving access through
Lantern will count against your limit. We recommend using Lantern with
unlimited Internet connections.

How can I contribute?
----------------------

See :ref:`getting-involved`.

Lantern's not working for me. What's up?
-----------------------------------------

There is a known incompatibility between Lantern and Proxy Switchy. If
you have Proxy Switchy installed, you can temporarily disable it to use
Lantern.

I have more questions, where do I go?
--------------------------------------

If you have more technical questions, please see the `Developers
Q&A <https://github.com/getlantern/lantern/wiki/%5Bdevelopers%5D-Questions-and-Answers>`__
page. Also feel free to post to the `user
forums <https://groups.google.com/group/lantern-users-en>`__ or the
`develepors forum <https://groups.google.com/group/lantern-devel>`__.
