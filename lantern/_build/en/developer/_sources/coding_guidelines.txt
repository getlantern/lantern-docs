==================
Coding Guidelines
==================

These are the general coding guidelines for programmers working on the Lantern code base.

#. Master should always be stable enough to release at any moment.
#. Development should take place on branches.
#. Each branch should be associated with one ticket or in rare cases several closely related tickets. If there are several closely related tickets, the branch creator should strongly consider consolidating the tickets into one.
#. Branches should be merged to master should be through pull requests.
#. If any client-side change depends on a server-side change, branches for the lantern controller should be merged at the same time as client-side branches. See rule #1.
#. All code should be tested thoroughly through both unit tests and manual tests as appropriate.
#. Client side changes potentially affecting raw functionality should always be checked with our QA script before being merged.
#. Any more complicated changes should be tested on multiple operating systems.
#. All tests should pass always.
#. If you make changes that break the tests, you should fix the tests. Don't expect someone else will fix them.