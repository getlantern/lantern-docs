.. _enviar-registros-do-lantern:

Enviar Registros do Lantern
===========================

Ocasionalmente os desenvolvedores do núcleo do Lantern irão solicitar
que você envie um email para eles com seus registros para melhor
diagnosticar um problema.

Para fazer isso você precisa achar o diretório de registros na sua
plataforma:

Windows Vista/7/8
'''''''''''''''''

``C:\Users\USERNAME\AppData\Roaming\Lantern\logs``

Windows XP
''''''''''

``C:\Documents and Settings\USERNAME\Application Data\Lantern\Logs``

OSX
'''

``~/Library/Logs/Lantern``

Ubuntu
''''''

``~/.lantern/logs``

O diretório deve ter arquivos do tipo ``java.log``, ``installer.log`` e
outros. Comprima todo o diretório em um único arquivo zip. Algumas vezes
ele pode conter apenas o java.log, que é o arquivo mais importante. Você
pode comprimir o arquivo para ficar menor, ou simplemente enviá-lo.

Anexe o zip ou o java.log em um email e envie-o para
team@getlantern.org. Deixe-nos saber se você gostaria de usar pgp para
encriptar seu email e nós podemos oferecer nossa chave pública.
