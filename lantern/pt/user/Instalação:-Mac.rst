.. _instalacao-mac:

Instalação: Mac
===============

Versões compatível
~~~~~~~~~~~~~~~~~~

Lantern compatível OS/X versão 10.6 e posterior, apenas 64 bits.

Instalação
~~~~~~~~~~

.. figure:: https://www.evernote.com/shard/s209/sh/8f36ed28-7670-4213-8a2f-e971a8de59ca/88a3b4388faf0766d3a3521a874e1f01/deep/0/Lantern%20Invitation%20-%20cholmes@cartodb.com%20-%20CartoDB%20Mail.png
   :alt: download lantern

   download lantern
Para baixar Lantern pelo seu e-mail de convite. Devesse fazer o download
de um arquivo chamado ``lantern-net-installer_mac_os_0_0_1.dmg``. Este é
relativamente pequeno - cerca de 1,5 MB - como ele é possível baixar
mais arquivos necessários a partir da internet.

.. figure:: https://www.evernote.com/shard/s209/sh/6b406cb3-6270-4117-ba61-d6a8e3281728/a04236b62b8daf0096ad2f6670c46696/deep/0/Menubar%20and%20lantern-net-inst%202%20and%20Applications.png
   :alt: install

   install
Dê um clique duplo sobre o arquivo .dmg, e , em seguida, clique duas
vezes no ícone 'Lantern Installer' .

.. figure:: https://www.evernote.com/shard/s209/sh/b39a5f0d-4aa9-4518-8a26-fd0a86de8737/9d3090f5eab319830f4510bc13bba90e/deep/0/Lantern%20Fetcher.png
   :alt: downloading

   downloading
Se você clicar sobre o arquivo .Dmg e nada acontece, o problema
provavelmente é que você não é um usuário administrador. A partir de
beta2 o lantern \_\*\*não\* \_ funciona se você não está executando como
um usuário administrador. Estamos `trabalhando
<https://github.com/getlantern/lantern/issues/819>`__ para solicitar a
senha do administrador em vez de apenas apresentar uma falha.

Contanto que você é um usuário administrador, clicando no .dmg o
instalador irá fazer várias coisas. Ele irá detectar se você tem Java, e
caso não tenha, ele irá baixar o Java Runtime Environment a partir da
web. Em seguida, ele irá baixar o código mais recente Lantern, para se
certificar de sua instalação é totalmente atualizada. Se você estiver em
uma conexão lenta esta etapa de download pode demorar um pouco.

.. figure:: https://www.evernote.com/shard/s209/sh/c92df454-472a-4ce1-a578-fc06843802d7/04fd633f4deb9fbeecc44562dff2ea78/deep/0/Screenshot%208/16/13%207:52%20PM.png
   :alt: install4j

   install4j
Em seguida, você receberá um aviso sobre 'install4g' . Install4g é um
programa que usamos para fazer a lantern instalar com uma experiência
mais suave em todas as plataformas, então basta digitar sua senha, para
que o Lantern possa obter permissão para se instalar e de fazer
alterações em suas configurações de proxy para que a sua conexão pode
ser compartilhada .

.. figure:: https://www.evernote.com/shard/s209/sh/377e6ed3-ce38-480b-b79a-bd0d540ae375/84fc0a6e71cbe529d194a4461c8d82be/deep/0/Screen%20Shot%202013-08-16%20at%207.52.52%20PM.png
   :alt: extracting

   extracting
Essa ação deve extrair os arquivos e, em seguida, iniciará um exemplo do
funcionamento do Lantern .

.. figure:: https://www.evernote.com/shard/s209/sh/57a422d3-27f1-4b45-b05c-09b87636ab23/8b8d1d84c456798cd0f3e045590dc3e7/deep/0/Lantern.png
   :alt: lantern default

   lantern default
Se você vê esta tela, está tudo pronto. Vá para :ref:`configuracao-`.

Parando o Lantern
~~~~~~~~~~~~~~~~~

Nós encorajamos você a apenas deixar Lantern executado em segundo plano,
para que ele possa estar ajudando os usuários censurados tenha acesso,
mesmo enquanto você está fazendo outras tarefas.

Se você fechar a janela um ícone Lantern ainda vai ficar no seu menu.
Para pará-lo completamente, clique no ícone de Lantern e selecione "Quit
Lantern".

.. figure:: https://www.evernote.com/shard/s209/sh/9308b039-b326-4160-b7d1-4f6f15c210a7/41fe4b0ebde601cb9ffd5d0ceb09a8c8/deep/0/Screen%20Shot%202013-08-16%20at%208.07.29%20PM.png
   :alt: quit lantern

   quit lantern
A desinstalação
~~~~~~~~~~~~~~~

Para desinstalar completamente Lantern você deve mover o ícone de
lantern na pasta Aplicativos para a lixeira. Você deve parar lantern
antes de fazer isso. Isso também irá desinstalar o Java Runtime
Environment do Lantern. Você também pode excluir o '''.lantern/'''
diretório no seu diretório home. Fazendo isso vai lhe solicitar
:ref:`configuracao-`, se você reinstalar lantern. Se você continuar, em
seguida, Lantern vai começar a trabalhar com a sua configuração
existente.
