Disclosed To
Reasons for Disclosure
Information
People You
 Invite to Join
 Lantern
Immediate
 Friends
Other
 Lantern
 Users
Lantern
 Fallback
 Proxies
Lantern
 Server
Google
Mandrill/
 MailChimp
Exceptional.IO
Your IP Address
x
x
x
x
- Give and Get mode users need to know each other's IP addresses to
proxy traffic through each other.  The same thing is true for Lantern
operated fallback proxies.
 - Lantern communicates directly with Google in order to authenticate
you, at which point your IP becomes know to Google
Your Email Address
x
x
x
x
x
x
x
#NAME?
Your Name
x
x
x
#NAME?
Your Online/Offline Status
x
x
x
#NAME?
Your Lantern
 Friends' Email
 Addresses
x
\*
x
- Lantern uses an extended trust network that allows friends of friends
of friends (and so on) to proxy traffic for each other.  These friends
are identified to each other via a unique identifier that includes their
email address and who are advertised to each other via their friends in
common.  Your immediate friends can tell who some of your other friends
are based on the advertisements that you send them.  Other Lantern users
will learn about some of your friends via the advertisement mechanism,
but they won't know that they are your friends, just that they are
Lantern users.
 - The Lantern Server tracks your list of friends for synchronizing them
to other computers of yours.
Your Geographic
 Location
x
x
x
x
?
- When users proxy through each other via Lantern they use a direct
connection for speed, which means that their geographic location is
known to each other.  This can be seen on Lantern's map visualization.
 - Lantern keeps track of user's geographic locations to track
country-level statistics about Lantern usage.
Server name of All Web Pages
 Viewed through Lantern
x
x
x
x
- When you proxy traffic through another Lantern instance, they have to
know the hostnames of pages that you're accessing in order to proxy the
traffic for you
 - If something goes wrong while attempting to access a web server, we
might report the problem to Exceptional.io (if "Securely report
anonymous usage statistics to contribute to Lantern" is checked)
URL and Contents of
 Unsecured Web Pages
 Submitted and Received
 Through Lantern
x
x
x
- When you proxy traffic through another Lantern instance, they have to
know the content that you're sending (and receiving) in order to proxy
it.  If you do not encrypt that content (i.e. by using an https:// url),
then the other Lantern user can see all of this content.
Google Authentication Refresh Token
x
x
- If you are a user with your own dedicated fallback proxy, your
fallback proxy stores and forwards kaleidoscope notifications on your
behalf while your own Lantern client is offline.  This ensures that
people don't miss notifications about new users in the trust network
(which come over Google chat).  In order to do this, the fallback
proxies hold on to a refresh token that gives them access to your Google
Talk account.
 The refresh token allows Lantern's servers to:
 - Know your email address
 - View basic information about your account
 - Send and receive chat messages on your behalf
 - Get a list of your chat buddies
 - Find out if you are online or offline with Google chat
