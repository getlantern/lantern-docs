This document captures a wishlist of items that we might want to change but
don't have any concrete plans on yet.

Consider switching to vert.x and sockjs
---------------------------------------
Vert.x has some nice properties, like its use of Netty and minimal config
(http://vertx.io/). It also works with sockjs
(https://github.com/sockjs/sockjs-client).

The downside is that it's not easily embeddable/designed to support embedding at
this time. Might be a nice change once it is as the vert.x and sockjs
communities seem a bit more active than jetty/cometd.