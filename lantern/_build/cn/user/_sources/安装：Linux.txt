目前在Linux平台，我们只有Ubuntu的安装包。如果您能提供对其它Linux发行版的支持，我们将非常高兴。其它发行版当然也可以\ `从源代码开始编译安装 <https://github.com/getlantern/lantern/blob/master/README.md#setting-up-a-development-environment>`__\ 。

Lantern邀请信里有一个链接指向一个安装脚本程序。这个脚本程序：

-  下载一个 .deb 文件
-  在/opt/lantern-net-installer目录里产生一个卸载脚本程序，
-  在用户的主目录下产生一个用户配置目录（～/.lantern，用户第一次启动Lantern之后，这个目录才会出现？）
-  *不会* 自动启动Lantern服务。

安装
~~~~

1. 在邀请信里点击“Ubuntu
   12.04+”这个链接，浏览器会打开一个新的标签页通知你下载开始了。
2. 你会看到一个弹出窗口，提示你把文件“lantern-net-installer\_unix.sh”存盘。下载开始。
   |弹出窗口|
3. 打开一个新终端（在主菜单栏上点击Ubuntu图标，然后键入terminal）。
4. 点击“终端”图标，就可以打开一个新终端了。 |找到并打开终端|
5. 进入你保存下载文件的目录：

-  ``cd Downloads/``

6. 把下载下来的脚本程序改为可执行文件：

-  ``chmod 700 lantern-net-installer_unix.sh``

7. 运行该文件：

-  ``sudo ./lantern-net-installer_unix.sh``
-  注意：如果你看到了类似“没有Java虚拟机”的提示信息的话，你得去安装Java。
-  如果你不知道怎么安装Java，可以看：
   https://help.ubuntu.com/community/Java
-  安装脚本开始运行

8.  你应该能看到“安装程序开始”之类的提示信息，而且桌面会弹出一个“Lantern
    Fetcher”窗口。在它去抓取Lantern程序的时候，你耐心等一会儿。
    |安装进行当中|
9.  安装程序结束时不会给出提示信息。
10. 在主菜单栏上点击“Ubuntu”图标，然后键入“lantern”。
11. 点击“Lantern”图标，就可以运行lantern程序了。

-  注意：如果你看到“Chrome没有安装”之类的提示信息，那就去下载、安装Chrome浏览器。
-  如果你不知道怎么下载、安装Chrome，可以看看：https://www.google.com/intl/en/chrome/browser/
   |运行lantern|

12. 耐心等一会儿，Lantern开始启动了。 |等待lantern加载|
13. Lantern欢迎你！ |Lantern欢迎你|

安装、启动完成之后，下一步就是 [[设置]] Lantern。

卸载
~~~~

1. 进入“/usr/local/lantern-net-installer/”目录

-  ``cd /usr/local/lantern-net-installer/``

2. 运行卸载程序

-  ``sudo ./uninstall``
-  |运行卸载程序|

3. 在弹出窗口里，点击“Next >”完成卸载。 |卸载程序|
4. 卸载开始了。结束的时候，点击“Finish”。 |卸载完成|

.. |弹出窗口| image:: http://i.imgur.com/justLyz.png
.. |找到并打开终端| image:: http://i.imgur.com/AGo6Hve.png
.. |安装进行当中| image:: http://i.imgur.com/S2hBiEY.png
.. |运行lantern| image:: http://i.imgur.com/pbBc1Rg.png
.. |等待lantern加载| image:: http://i.imgur.com/6m3gh25.png
.. |Lantern欢迎你| image:: http://i.imgur.com/nnXoFjr.png
.. |运行卸载程序| image:: http://i.imgur.com/PW3hiCF.png
.. |卸载程序| image:: http://i.imgur.com/PuEPZrB.png
.. |卸载完成| image:: http://i.imgur.com/7XZayjD.png
