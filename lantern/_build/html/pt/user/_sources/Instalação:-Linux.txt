.. _instalacao-linux:

Instalação: Linux
=================

O pacote de instalação atual para o Linux está disponível apenas para
Ubuntu. Contribuições para outros distros Linux e melhorias para fazer
um melhor uso do gerenciador de pacotes são muito apreciados. Outras
distros também podem sempre `dar build pelo
código <https://github.com/getlantern/lantern/blob/master/README.md#setting-up-a-development-environment>`__.

O convite para o Lantern tem um link para o script de instalação. Esse
script:

-  Baixa um arquivo .deb
-  Cria um script para desinstalação no /opt/lantern-net-installer,
-  Cria um diretório de preferências de usuário, e
-  Não inicia automaticamente um serviço Lantern;

Instalação
~~~~~~~~~~

1.  Clique no link chamado "Ubuntu 12.04+" no instalador. Uma nova aba
    deve abrir dizendo que um download deve começar.
2.  Uma janela deve aparecer, pedindo para que você salve um arquivo
    chamado "lantern-net-installer\_unix.sh". Baixe o arquivo. |download
    popup|
3.  Abra uma nova instância do terminal clicando no botão do Ubuntu
    barra de menu do Ubuntu e digitando "terminal".
4.  Clique no ícone do "terminal" para lançar uma nova instância.
    |finding terminal|
5.  Mude para o diretório onde você baixou o arquivo:

    -  ``cd Downloads/``

6.  Faça o script de instalação executável:

    -  ``chmod 700 lantern-net-installer_unix.sh``

7.  Execute o script de instalação:

    -  ``sudo ./lantern-net-installer_unix.sh``
    -  Nota: se você receber uma mensagem if you receive a message em
       relação a falta do Java Virtual Machine adequado, vocie precisa
       baixar o Java.
    -  Veja https://help.ubuntu.com/community/Java se você precisa de
       ajuda para completar esse passo.

8.  Uma mensagem deve aparecer dizendo que o instalador está começando e
    uma janela deve aparecer com o título "Lantern Fetcher". Espere
    enquanto ele busca o programa Lantern. |installing|
9.  O instalador vai terminar e não dará nenhuma mensagem.
10. Abra o Lantern clicando no botão do Ubuntu barra de menu do Ubuntu e
    digitando "lantern".
11. Clique no ícone do "Lantern" para executar o programa.

    -  Nota: se você receber uma mensagem em relação ao Chrome estar
       instalado, você precisa baixar o Chrome.
    -  Veja https://www.google.com/intl/en/chrome/browser/ se você
       precisa de ajudar para completar esse passo. |running lantern|

12. Espere enquanto o Latern inicia. |waiting for lantern to load|
13. Bem vindo ao Lantern! |welcome to lantern|

Depois que você tiver rodado o instalador o próximo passo é a
:ref:`configuracao-` do Lantern.

Desinstalação
~~~~~~~~~~~~~

1. Mude o diretório para "/usr/local/lantern-net-installer/"

   -  ``cd /usr/local/lantern-net-installer/``

2. Rode o desinstalador do programa.

   -  ``sudo ./uninstall``
   -  |run uninstall script|

3. Uma janela deve aparecer. Clique em "Próximo >" para continuar a
   desinstalação. |uninstall program|
4. O processo de desinstalação deve começar. Quando terminar, cliquei em
   "Finish" |uninstall complete|

.. |download popup| image:: http://i.imgur.com/justLyz.png
.. |finding terminal| image:: http://i.imgur.com/AGo6Hve.png
.. |installing| image:: http://i.imgur.com/S2hBiEY.png
.. |running lantern| image:: http://i.imgur.com/pbBc1Rg.png
.. |waiting for lantern to load| image:: http://i.imgur.com/6m3gh25.png
.. |welcome to lantern| image:: http://i.imgur.com/nnXoFjr.png
.. |run uninstall script| image:: http://i.imgur.com/PW3hiCF.png
.. |uninstall program| image:: http://i.imgur.com/PuEPZrB.png
.. |uninstall complete| image:: http://i.imgur.com/7XZayjD.png
