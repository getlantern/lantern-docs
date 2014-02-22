==============================
Releasing Jars to Maven Central
==============================

Lantern uses a special script and the nexus staging maven plugin to
release to central. With ./bin/mvnrelease.bash on your path, you can do
the following:

::

    mvnrelease.bash gpg-password git-username git-password

in the same directory that has the pom.xml of the project you want to
release. That will automatically supply your usernames and passwords
when the various called subroutines require them.

Note that the mvnrelease.bash script also looks for releasePrepare.exp
and releasePerform.exp in the same directory. Those files are also found
in bin, so one easy approach is to copy all three files to somewhere on
your path like /usr/local/bin

To do the above manually, simply run:

::

    mvn release:clean
    mvn release:prepare
    mvn release:perform
    cd target/checkout/ 
    mvn nexus-staging:release

