====================
Maven Deployment
====================

We keep our maven repository on S3 using the Spring `maven/s3
plugin <https://github.com/SpringSource/aws-maven>`__. You need to set
your s3 credentials in settings.xml as in:

::

    <settings>
        ...
        <servers>
            ...
            <server>
                <id>aws-release</id>
                <username>0123456789ABCDEFGHIJ</username>
                <passphrase>0123456789abcdefghijklmnopqrstuvwxyzABCD</passphrase>
            </server>
            <server>
                <id>aws-snapshot</id>
                <username>0123456789ABCDEFGHIJ</username>
                <passphrase>0123456789abcdefghijklmnopqrstuvwxyzABCD</passphrase>
            </server>
            ...
        </servers>
        ...
    </settings>

You can use the script at:

::

    bin/dep.bash

to make things slightly more convenient. It basically just does:

::

    mvn deploy:deploy-file -DgeneratePom=true -DrepositoryId=aws-release -Durl=s3://lantern-mvn-repo/release -Dpackaging=jar -DgroupId=$1 -DartifactId=$2 -Dversion=$3 -Dfile=$4 -Dsources=$5

