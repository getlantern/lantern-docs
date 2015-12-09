
Integrate Lantern
*****************

.. index:: SDK Onboarding Tool, gradle, artifactory

The Lantern Android library includes manual integration instructions to integrate the library into your Android applications.

Manual Setup
============

This guide assumes you are using Gradle. For more information about Gradle, refer to the `Android developer site <http://tools.android.com/tech-docs/new-build-system>`_.

Modify build.gradle
-------------------

Update your project's build.gradle script to include the Maven repository and apply the Lantern plugin:

.. code-block:: groovy
    :emphasize-lines: 4,13,17

    buildscript {
      repositories {
        jcenter()
        maven { url 'https://maven.lantern.io/public' }
      }
      dependencies {
        classpath 'org.getlantern.lantern:sdk:1.+'
      }
    }

    apply plugin: 'com.android.application'
    //Put Lantern plugin after Android plugin
    apply plugin: 'org.getlantern.lantern'

    repositories {
        jcenter()
        maven { url 'https://maven.lantern.io/public' }
    }

.. note:: Some of the SDKs introduced here use third party dependencies. Having access to resolve Maven Central or an alternative artifact store is a requirement.

Updating your application
----------------

To have all of your app's traffic proxied through Lantern, you simply add a call to code:`Lantern(this.getApplicationContext)`. The ideal place to put this is in Android's :code:`Application` class.

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
            lantern.start()
        }
    }

.. note:: Make sure to add the fully qualified name of :code:`Application` sub-class to the :code:`android:name` attribute in the applications manifest.


.. note:: We want your app to start as fast as possible, so we take care to ensure that all initialization occurs off of the main UI thread.

