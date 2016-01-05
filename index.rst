
Integrate Lantern
*****************

.. index:: SDK Onboarding Tool, gradle, artifactory

The Lantern Android library includes manual integration instructions for integrating the library into your Android applications.

Manual Setup
============

This guide assumes you are using Gradle. For more information about Gradle, refer to the `Android developer site <http://tools.android.com/tech-docs/new-build-system>`_.

Modify build.gradle
-------------------

Update your project's build.gradle script to include the Lantern classpath dependency. Make sure you include the Maven central repository:

.. code-block:: groovy
    :emphasize-lines: 4,7,12

    buildscript {
      repositories {
        jcenter()
        maven { url "https://oss.sonatype.org/content/repositories/snapshots" } 
      }
      dependencies {
        classpath 'org.getlantern:android-sdk:1.9.2-SNAPSHOT@aar'
      }
    }

    dependencies {
        compile 'org.getlantern:android-sdk:1.9.2-SNAPSHOT@aar'
        ...
    }

.. note:: Some of the SDKs introduced here use third party dependencies. Having access to resolve Maven Central or an alternative artifact store is a requirement.

Updating your application
----------------

For Lantern to power your app, simply add a call to :code:`Lantern(this.getApplicationContext)`. The ideal place to put this is in Android's :code:`Application` class.

.. code-block:: java

    package com.example.app;

    import org.getlantern.lantern.sdk;
    import android.app.Application;

    public class MyApplication extends Application {
        @Override
        public void onCreate() {
            super.onCreate();

            // enable Lantern
            Lantern lantern = new Lantern(this.getApplicationContext());
            lantern.start();
        }
    }

.. note:: By default, Lantern will listen on :code:`127.0.0.1:8787`. You can customize this by creating a :code:`settings.yaml` file in your app resources directory and specifying a :code:`httpaddr` field.
.. note:: Make sure to add the fully qualified name of :code:`Application` sub-class to the :code:`android:name` attribute in the applications manifest.
