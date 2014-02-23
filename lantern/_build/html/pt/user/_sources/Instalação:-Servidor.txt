Para executar Lantern em um servidor (como EC2 ou outro servidor você
tem acesso), você vai querer executá-lo sem a interface do usuário.

A maneira de fazer isso agora é para `build from
source <https://github.com/getlantern/lantern/blob/master/README.md#setting-up-a-development-environment>`__
e rodar com ``--disable-ui``.

Como não há GUI, você precisa de alguma outra maneira de dizer ao
cliente quem é você. Você pode fazer isso copiando os seguintes arquivos
para a sua máquina EC2:

https://github.com/getlantern/lantern/blob/master/src/main/resources/client\_secrets\_installed.json

(No qual, ao contrário do seu nome, não é realmente um arquivo secreto)
e

https://github.com/getlantern/lantern\_aws/blob/master/salt/fallback\_proxy/user\_credentials.json

Você precisa editar esse último arquivo substituindo o seu endereço de
e-mail para o {{ pillar['user'] }} ( isto é, manter as aspas duplas ,
mas substituir tudo dentro deles com seu e-mail ). É necessário
substituir a entrada {{ pillar['refresh\_token'] }} também. O mais fácil
(mas ainda reconhecidamente pesado) maneira de obter o "refresh token"
que é o que você precisa para realizar:

-  Compilar o código fonte do Lantern em uma máquina com um sistema de
   janelas,
-  Rodar Lantern usando a linha de comando passando argumentos,
-  Logar normalmente como o usuário que você deseja faça com que o
   servidor seja executado como desejar,
-  Abrir o arquivo ``~/.lantern/test.properties`` ( onde ~ é o seu
   diretório home) ,
-  O seu "refresh token" é tudo para lhe dar direito para iniciar a
   linha com ``=`` e complementar com algo, como
   ``refresh_token=1/qBOzC[...]qkLE``.

Uma vez que você tem isso, você roda Lantern assim:

     --disable-ui --force-give --oauth2-client-secrets-file
--oauth2-user-credentials-file

(-force-give será dará modo de acesso, Esse é o padrão como esta
escrito, mas você não pode compartilhar-lo.).

Em seguida, você pode usar algo como ``screen`` para deixar rodar
Lantern em background.

Como alternativa , se a sua instância EC2 roda Linux e você deseja
deixar o lantern em execução como um serviço, e para ser iniciado
automaticamente na inicialização do sistema, você pode encontrar este
útil :

https://github.com/getlantern/lantern\_aws/blob/master/salt/fallback\_proxy/lantern.init

Para usá-lo ,  - Linha de edição 21 para apontar para o executável
Lantern.  - Editar a linha 22 para usar apenas os argumentos que você
definiu anteriormente.  - Copiar o arquivo para /etc/init.d/lantern  -
Dar-lhe direitos de permissões do administrador:        sudo chown
root:root /etc/init.d/lantern sudo chmod 700 /etc/init.d/lantern  -
Iniciar o lantern como um serviço. Em muitas distribuições Linux você
faz isso assim:         sudo /etc/init.d/lantern start    embora no
Ubuntu e alguns outros que você pode também dizer         sudo service
lantern start

A interface sem GUI não fornece uma maneira de adicionar amigos, mas
você pode fazer isso através da interface gráfica do usuário em sua
máquina de casa.
