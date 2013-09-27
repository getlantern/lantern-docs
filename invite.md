# Inviting

## State of this document

This is a rough first draft, treating various details in very disparate degrees of completeness, and may contain errors.  Hopefully, more details on all aspects of this system will be added as we find the need to document our understanding of them, to the point that this may become an authoritative description of the invite system.

## Overview

Inviting is the most typical way in which new users are added to Lantern.  When a Lantern user first adds another person as a friend in the UI, their client sends a request to invite that person.  Various checks are done both in the client and in the controller during the processing of this request, which may cause it to be cancelled or delayed.  If and when an invite passes all these filters, it eventually should lead to the invitee being registered into the Lantern system (if not already registered), so that the controller will listen to its requests and notifications from then on.  Also, an invitation e-mail will be sent to the invitee, with instructions on how to install Lantern.

## Mechanisms

The controller receives invites in a custom field in an XMPP Available presence stanza.  After some basic checks, we hold them in the controller for manual approval by Lantern administrators (invites by administrators themselves are exempt from this).  On approval, an invite is further processed to possibly trigger one of these effects:

- An LanternUser entry for the invitee is added to the datastore.  This means the user will be recognized by the controller as a Lantern user, so the controller will accept and process their XMPP messages in the future.
- If a fallback proxy running as the inviter (XXX: this detail is about to change!) already exists, an e-mail will be sent to the invitee, containing links to Lantern installer wrappers.  These are programs that will install Lantern and initialize so it knows to use the fallback proxy assigned to them.
- If such a fallback proxy doesn't exist yet, it will be launched (if it isn't already launching), and an e-mail as described above will be sent *when* the controller detects that the proxy is up.

### Invite entries

To keep track of invite requests being currently processed, and to prevent repeated requests (that is, from the same inviter to the same invitee) from being processed in the future, we store all current and past invites in the controller Datastore (see org.lantern.data.Invite).

## Known Issues

### Cruft and dubious factoring/naming

There are some leftovers of an old system where users had a number of allowed invites.  Also, the naming of some of the functions in this system could be more accurate/descriptive, and perhaps some refactoring could make the code clearer.  Let's take on these as we get a better overall grasp of the system.
