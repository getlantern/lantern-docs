.. _fallback-proxy-load-balancing:

Fallback Proxy Load Balancing
=============================

Lantern maintains a set of `cloud fallback proxy servers <../user/Lantern-Cloud-Servers.html>`_ for users who aren't able to connect through a peer in their trust network. This can happen because none of their peers are online or none of their peers are reachable.

In addition to helping users access the Internet, these fallback proxies are vitally important during the installation and setup of Lantern. They allow access to Google Accounts and Google Talk so that users can join the Lantern network in countries where these services are blocked.

Assigning Fallback Proxies
--------------------------
Every Lantern instance is assigned to only one fallback proxy, which is set by the 
installer wrapper they received in their invite e-mail. In addition to downloading and 
executing a Lantern installer, these wrappers create a file (`~/.lantern fallback.json`) 
with the fallback proxy data. Other proxies are possibly discoverable through the 
kaleidoscope network.

When a user invites another user, Lantern ensures that there is only one fallback proxy on 
behalf of the inviter. This fallback proxy is assigned to the invitee as their fallback proxy. 
Future invitees by the original inviter are assigned to that same fallback proxy. When one 
of the invitees invites someone new, Lantern spins up a new fallback proxy for that user, 
which becomes the fallback for all of their invitees, and so on.

An original rationale for this approach of spinning up fallback proxies
tied to inviters was to limit the exposure of users should a fallback
proxy have been compromised by the inviter. Per aranhoide, this
rationale is questionable. aranhoide - "I used to think so; not anymore."

If a proxy is compromised *n* users will have degraded service. Assuming the node was
discovered by infiltration, there is some poetic justice in the fact that these will be neighbours of the
infiltrator, but the damage is no more or less than if any other *n* users anywhere else in the
trust graph were affected instead. The constraint that we must have all proxies serve invitees 
of the same inviter, either directly, as currently, or transitively, as in this proposal, 
only adds unwarranted difficulties to any recovery plan, IMO"

The current approach creates two problems:

1. Many proxies end up under-utilized because the corresponding inviter
   invites too few other Lantern users, or too few of them end up using
   Lantern. This ends up wasting capacity that costs money to maintain.

2. Some proxies end up over-utilized because the sub-tree contains too
   many users. This adversely impacts the user experience of users who
   rely on those fallback proxies.

In order to address both of these problems, we need to introduce some
sort of load balancing that allows us to:

1. Allow a single fallback proxy to serve the invitees of multiple
   inviters

2. Use multiple fallback proxies to serve the invitees of a single
   inviter

Solution for Problem 1 - Expanded inviter tree for a single proxy
-----------------------------------------------------------------

I'll let aranhoide expand on this, but the basic idea is that when a
user with no associated fallback proxy invites another user, rather than
spinning up a new proxy, we search the inviter's trust graph to find the
nearest user with an available fallback proxy and use this for the
invitee.

Solution for Problem 2 - Multiple Fallback Proxies per Inviter
--------------------------------------------------------------

Currently, fallback proxies are assigned to users during the invitation
process. This is necessary because it allows us to provide customized
installers that contain the correct fallback proxy and allow Lantern
users to get online via that fallback proxy in case Google Accounts
and/or Google Talk are blocked in their country.

Unfortunately, the invitation process does not give us a good mechanism
to load balance amongst fallback proxies because we don't know how
heavily utilized a fallback proxy is until someone actually installs
Lantern and starts using it. In the most extreme case, one can imagine
that a very lightly utilized fallback ends up getting included in a
large number of invitations. If all, or many, of these invitations get
accepted and these users end up actively using Lantern, their fallback
proxy will end up over-utilized.

This means that we need a mechanism for re-balancing after invitations
have already gone out. There are a few different approaches available:

Approach A: Kaleidoscope
------------------------

Kaleidoscope already provides us with a mechanism for using trust
relationships between peers to connect to peer proxies. From the
perspective of a Give mode user, every proxy that runs under a trusted
identity is made available for proxying and the Lantern client already
load balances amongst these. Fallback proxies are in fact just Lantern
instances, so perhaps we can leverage Kaleidoscope to make them
discoverable to Give mode users.

The basic idea would be that when we create the install wrapper, in
addition to adding the fallback proxy's ip address to the Lantern
client's list of fallbacks, we also permanently add that Proxy's XMPP
identity to the client's roster.

The client would use the fallback IP only if it doesn't know about any
other proxies (fallback or peer). Once the client learns about the proxy
instance via KScope, the client would start using that instead. If the
fallback gets overloaded, we can spool up additional instances under the
same XMPP identity, which will become available to the client via
KScope. The client will automatically load balance amongst these
instances.

Approach B: Controller-based fallback reassignment
--------------------------------------------------

1. Currently, LanternUser keeps track of an installerLocation
   corresponding to a custom installer that encapsulates the fallback
   proxy that will be used by that user's invitees. Let's change this to
   be a List of installerLocations that can keep track of new installers
   as we add them.

2. When sending out an invitation from an existing user with an existing
   fallback proxy, use the most recent installerLocation from the list
   (as opposed to just the single installerLocation like we do today).

3. Have fallback proxies track and report the maximum # of distinct
   clients that have connected to that proxy via Librato (already
   implemented).

4. Implement a batch job in the controller that monitors all fallback
   proxies for activity using the metric from #3. If a fallback proxy
   gets too busy (i.e. # of distinct clients exceeds threshold):

5. Spin up a new fallback proxy for LanternUser who owns it

6. Randomly reassign N LanternUsers in the sub-tree to the new fallback
   proxy, where N = max distinct clients - threshold (this probably
   requires us to add a property to LanternUser that tracks the fallback
   proxy that they're using (as opposed to the one their invitees will
   use).

7. Implement a protocol between Lantern instances and the controller
   (probably on the XMPP channel) that tells Lantern instances which
   fallback proxy they should be using.

8. In the Lantern client, if the client is told to use a different
   fallback proxy than the one currently in use, switch to the new
   fallback proxy and save this in .lantern for future startups. The old
   one should no longer be used at this point.


