=====================
QA Scripts
=====================

Basic Get Mode test script
--------------------------

The test script should still succeed as long as Lantern can reach a
fallback proxy. When we switch to give mode about halfway through the
script, you'll enter the following in your /etc/hosts file:

::

    0.0.0.0 talk.google.com
    0.0.0.0 accounts.google.com
    0.0.0.0 google.com

Alternately, if you have access to a firewall, you can block the below
ip ranges

::

    216.239.32.1 - 216.239.63.254
    54.233.160.1 - 54.233.191.254
    66.249.80.1 - 66.249.95.254
    72.14.192.1 - 72.14.255.254
    209.85.128.1 - 209.85.255.254
    74.125.0.1 - 74.125.255.254
    207.126.144.1 - 207.126.159.254

Note - these will change over time. Up to date ranges can be obtained by
calling ``dig @ns1.google.com -t txt _netblocks.google.com`` and
converting the resulting \_netblocks to ip ranges using this `online ip
calculator <http://jodies.de/ipcalc>`__.

1.  Make sure Lantern is not running
2.  Open up your system proxy settings and verify that you have no
    system proxy set. If your OS keeps this window up-to-date with your
    system proxy settings without your having to close and reopen it (OS
    X does, Ubuntu doesn't, afaik), keep this window visible while you
    interact with Lantern in the following steps so you can see exactly
    if and when Lantern changes the settings.
3.  Nuke your ~/.lantern directory if you have one
4.  Install Lantern from an install wrapper on Amazon S3 that was sent
    to you in an email (it's okay if this is an old version of Lantern)
5.  Shut down Lantern
6.  Install the test build of Lantern (which will have the effect of
    starting it)
7.  Choose Give Access
8.  Choose Sign In
9.  Sign in to Google with an invited account and click Allow access
10. Click Continue (on the Lantern Friends modal)
11. Click Finish
12. Verify your green dot is in an accurate spot on the map, and when
    you hover over it all your details (including IP address) are
    accurate
13. Visit whatismyipaddress.com in a browser
14. Verify your public IP is the same as what was shown on the map
15. **We're now going go switch to get access mode**. Add the google
    mappings above to your /etc/hosts file to simulate Google being
    blocked (see beginning)
16. Click Settings button (gear icon)
17. Click Get Access
18. You should be taken to the Proxied Sites modal. Click Continue
    (should be "Continue" and not "Close" if setupComplete was correctly
    set back to false)
19. Check your system proxy settings are now configured to use Lantern's
    PAC file.
20. Back in Lantern, you should have been taken back to the
    visualization. Your dot should now be orange. When you hover over
    it, your details should be the same as before (including IP
    address).
21. You should now see a dark green dot corresponding to your fallback
    proxy. Hover over it and make a note of its IP.
22. Reload whatismyipaddress.com, and see that an arc is drawn
    connecting your orange dot to the green dot.
23. Verify the IP that whatismyipaddress.com is showing is now that of
    the fallback proxy, and that this matches the fallback proxy that
    should have been assigned to you based on your install wrapper from
    Amazon S3.
24. Click Proxied Sites button (web icon)
25. Add geoiptool.com to the textarea and click Continue
26. Visit geoiptool.com and verify the IP and location it shows for you
    are the same as the fallback proxy's and not your orange dot's.
27. Quit Lantern
28. Check your system proxy settings now have no proxy set
29. Repeat steps 13-14
30. Restart Lantern
31. Check your system proxy settings now have Lantern's pac file set
32. Repeat steps 22-23 and then step 26
33. Go back to Settings and click Reset
34. Repeat steps 7-14


Also Test:

-  autostart on system startup
-  p2p

