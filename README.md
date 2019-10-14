# Vagrant Shell Script

Script para control básico de los servidores Vagrant para entorno de desarrollo

Para efectos de la personalización con respecto a los servidores debe editar el archivo en ./scripts/vgserver.sh antes de ejecutar el installer y agregar cuantos servidores necesite a efectos de poder inicializar todos a la vez con el comando 'up -a', pero no tendrá problema alguno inicializando individualmente por medio del nombre de la máquina. Si ya utilizó el installer y desea agregar más máquinas, deberá editar el archivo vgserver.sh en /home/scripts/vgserver.sh

Para realizar la instalación simplemente ejecutar

```shell
    sh installer.sh
```

Bajo este metodo el alias utilizado para comunicarse con el script será 'vgserver', si desea configurar su propio alias ejecutar

```shell
    sh installer.sh 'alias'
```

Esto configurará el alias deseado. Realizar el proceso una vez.

Al finalizar debe ejecutar el siguiente comando para activar el alias en el entorno por consola

```shell
    source ~/.bashrc
```

