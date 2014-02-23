=================
Lantern Debugging
=================


Debugging the many complex layers of proxying in Lantern can often get
confusing. Here are some frequently encountered issues and how to diagnose them.

Chrome Stops Using a Proxy When it Thinks it's Bad
--------------------------------------------------
 
See chrome://net-internals/proxyservice.config#proxy  to see if this is
the case and reset it if it is. Lantern can get on the list if you're
working on proxying code and break it, for example, or if a CTRL-C
bypasses the shutdown handler and results in the unproxy code not
getting called, or if the unproxy code does get called but after the
Lantern proxy is shut down. You get the idea!

Working on p2p and/or Cipher Code
---------------------------------
If you're working on p2p and/or cipher code, you might stumble across
something like the following when creating TLS connections between
peers (either over reliable UDP or over TCP):
**javax.net.ssl.SSLHandshakeException: no cipher suites in common**.
This can have a number of causes, but a frequent one is that there's
a mismatch between you and the peer you're connecting to in terms of
unlimited strength policy files for encryption. In that case, one
peer will be using a weaker cipher suite and the other a stronger
one, resulting in "no cipher suites in common." The solution is to
install the unlimited strength policy files *for the JVM you're
actually running with.*

PAC File Debugging
------------------
Running chrome with the following chrome flags
   allows logging in pac files:

   ::

       --enable-logging --v=1

   That'll be logged here:

   ::

       http://dev.chromium.org/user-experience/user-data-directory

Lantern-UI
----------

The Lantern UI is rendered inside a standalone instance of Google
Chrome. As such, the Google Chrome developer tools are available and
are an essential debugging tool. (See
https://developers.google.com/chrome-developer-tools/docs/console for
a guide to their usage.)

AngularJS
---------
If this is your first encounter with an AngularJS app, read the
`AngularJS Docs <http://docs.angularjs.org/guide/>`__ and associated
references so you understand how it works. The `AngularJS Batarang <https://github.com/angular/angularjs-batarang>`__ can also be useful.

The model object is published to the ``window`` global for easy
interactive inspection from the JavaScript console (as well as a
``rootScope`` object, the scope of the RootCtrl controller). You can
also make local changes by modifying fields on ``model``. You may
have to call ``rootScope.$apply()`` afterwards to get your changes to
take effect (if an Angular digest cycle is not already triggered
automatically by an event within the app).

If you are running from a release build, the backend (and therefore
frontend) will not be running in dev mode. To enable dev mode on the
frontend (and therefore debug logging to the Javascript console), set
``model.dev`` to true in the JavaScript console. Note that the
backend may override this in a future model update.

Setting ``logLevel: 'debug'`` in the cometdSrvc configuration in
`services.js <https://github.com/getlantern/lantern-ui/blob/master/app/js/services.js>`__
can also help debug issues with cometd.


