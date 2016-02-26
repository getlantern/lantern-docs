
Integrate Lantern
*****************

.. index:: SDK Onboarding Tool, gradle, artifactory

The Lantern Android library includes manual integration instructions for integrating the library into your Android applications.

Manual Setup
============

This guide assumes you are using Gradle. For more information about Gradle, refer to the `Android developer site <http://tools.android.com/tech-docs/new-build-system>`_.

Download liblantern.aar and sdk-debug.aar
-----------------------------------------
Download `liblantern.aar <https://s3.amazonaws.com/lantern/androidsdk/liblantern.aar>`_
and `sdk-debug.aar <https://s3.amazonaws.com/lantern/androidsdk/sdk-debug.aar>`_
and place them in the :code:`libs` folder of your Android project.

Modify build.gradle
-------------------

Update your project's build.gradle script to include the Lantern classpath dependency. Make sure you include the Maven central repository:

.. code-block:: groovy
    :emphasize-lines: 4-6,10-11

    repositories {
        ...

        flatDir{
            dirs 'libs'
        }
    }

    dependencies {
        compile(name:'liblantern', ext:'aar')
        compile(name:'sdk-debug', ext:'aar')
        ...
    }

Updating your application
-------------------------

You can embed Lantern to run directly within your application, or have Lantern
run as a service inside of its own process. Running as a service is useful if
your application is already resource intensive and needs to minimize its memory
usage.

Both ways of embedding Lantern are similar.  A good place to start Lantern is in
Android's :code:`Application` class.

.. code-block:: java

    package com.example.app;

    import org.lantern.mobilesdk.Lantern;
    import android.app.Application;

    public class MyApplication extends Application {
        @Override
        public void onCreate() {
            super.onCreate();

            boolean asService = true; // up to you

            // enable Lantern
            int startupTimeoutMillis = 30000;
            
            // Optional Google Analytics tracking ID that gives Team Lantern
            // feedback on your app's usage of Lantern.
            String trackingId = "UA-...";
            
            if (asService) {
                Lantern.enableAsService(getApplicationContext(), startupTimeoutMillis, trackingId);
            } else {
                Lantern.enable(getApplicationContext(), startupTimeoutMillis, trackingId);
            }
        }
    }

.. note:: Make sure to add the fully qualified name of :code:`Application` sub-class to the :code:`android:name` attribute in the applications manifest.

To run Android as a service, you'll need to add the following to your
:code:`AndroidManifest.xml`.

.. code-block:: xml
    :emphasize-lines: 4-8
    
    <application>
        ...

        <service
            android:name="org.lantern.mobilesdk.service.LanternService"
            android:exported="false"
            android:process=":LanternService"
            />

        ...
    </application>
