# Inviting

## Overview

The lantern controller keeps a registry of Lantern users.  The controller will only accept requests and notifications from users in that registry.  As of this writing, Lantern will not work at all for other users.

New users are added to Lantern when they're *invited* by existing ones.  When a Lantern user first adds another person as a *friend* in the UI, their client notifies the controller that they want to invite that person.  The invite request is held in the controler for manual approval by administrators, upon which

- the invitee is registered as a Lantern user (if they are not already one),
- a *fallback proxy* [*] is (possibly launched and) chosen for backup service, and
- an invitation e-mail is sent to the invitee, with instructions to install Lantern.

This document describes that process in more detail.

## Concepts

### Fallback proxies

Fallback proxies are Lantern instances that we run in VPSs (as of this writing, EC2 instances and Digital Ocean droplets), in order to provide access to infrastructure needed by Lantern (i.e. Google Accounts and Google Talk), and to provide backup HTTP(S) proxying and relay Kaleidoscope messages for users whose friends are not online.

Since they are regular Lantern instances, they impersonate some user in XMPP.  We say the proxy is "running as" or "in behalf of" that user.

### Fallback proxy users

Fallback proxies run as regular Lantern instances, which means they assume the identity of some user in XMPP.  We call such a user a *fallback proxy user*.

At this moment only a small subset of our userbase have proxies running as them, and there is no automated way for new users to join this subset; we only ever do it manually.

Whenever we add a new user to Lantern, we need to match them with a fallback proxy.  To this end, we associate every potential inviter (that is, every Lantern user) with a fallback proxy user.  From that, we obtain the fallback proxy to assign to the invitee (launching a new one if necessary), and a set of installer URLs for the invitation email.

We store this relation as a fallbackProxyUserId field in the LanternUser entries.  Users as whom we are running fallback proxies have this field set to themselves.  Other users have the field initialized when they first log in to Lantern (an invitee may receive more than one invitation; it's only when they log in that we get to know which one they chose).  The client reports the host and port of the fallback proxy assigned to it, which we match against the listenHostAndPort of `LanternInstance`s.  The `user` of the instance thus found becomes the fallbackProxyUserId of the new user.

### States of an invite

The state of an invite can be decomposed in a few (not totally orthogonal) aspects:

- Authorized?  We currently hold invites for manual approval by administrators.  Invites with degree [*] less than 2 are automatically authorized.  This is saved as the Invite.state.  An invite with state other than `queued` has been authorized.
- Do we have fallbackProxyUserId for the inviter?  We need that in order to match the invitee with a fallback proxy.  If we don't have it, we hold the invite until the inviter logs in with a client modern enough to provide the information necessary to determine this.  This is not stored in the Invite entry, but checked directly in the LanternUser entry for the inviter.  Note that this is a transitional state.  New clients will have provided this info by the time they invite anyone.
- Is the fallback proxy that will be serving the invitee up and running?  If it's not, we hold the invite until it is.  To check this, we look at fallbackForNewInvitees of the inviter's fallback proxy user.

## Implementation

### Invite entries

To keep track of invite requests being currently processed, and to prevent repeated requests (that is, from the same inviter to the same invitee) from being processed in the future, we store all current and past invites in the controller Datastore (see org.lantern.data.Invite).

The controller receives invites in a custom field in an XMPP Available presence stanza.  The controller checks that the inviter is a Lantern user and that an invitation from them to this inviter has not been processed before.  After that, the invite is held until it has been manually approved by an administrator (invites by users of "low degree" [*] are exempt from this).

At this point, the invitee is added to the user database if not there already.  We still need to inform the user and provide them with a Lantern installer.  But before we can do that, two more conditions must be met:

- we need to determine the inviter's *fallback proxy user*, that is, the closest ancestor in their trust graph as whom we are running fallback proxies (we'll elaborate on this shortly), and
- a fallback proxy with enough capacity is running as the inviter's fallback proxy user.

Once all the above is true, we send an email to the invitee informing them that they have been invited to Lantern.  This email contains links to Lantern installers for several platforms.  These installers contain the IP and port of the fallback proxy we have chosen to serve the invitee.

