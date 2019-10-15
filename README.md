#
# Vagrant Shell Script

Script para control básico de los servidores Vagrant para entorno de desarrollo

* ## Instalación

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

#
# Uso

* ## init / create
Para crear una instancia existen 2 parámetros admitidos, 'init' y 'create', deberá indicar tanto la versión que desea inicializar como el nombre de la carpeta que contendrá el VagrantFile. Si desea un VagrantFile sin comentarios ni ayudas solo agregue '-m' a la versión.

Ejemplos

```shell
    vgserver [create|init] 'debian/buster64' 'folderName'
```

o

```shell
    vgserver [create|init] '-m debian/buster64' 'folderName'
```

Si desea sobreescribir un VagrantFile existente en una carpeta deberá indicar la carpeta y la versión igualmente pero agregando '-f' a la versión

Ejemplos

```shell
    vgserver [create|init] '-f debian/buster64' 'folderName'
```
Esto creará tanto la carpeta contenedora como el VagrantFile dentro de la ruta default /home/VagrantInstances/

Esta información la encontrará utilizando

```shell
    vgserver [create|init] [-h|--help]
```


* ## up / start

Para iniciar una instancia existente cuenta con 2 opciones, en primer lugar para iniciar una instancia dentro de la carpeta default '/home/VagrantInstances/' solo deberá utilizar 'up' o 'start' indicando el nombre de la carpeta contenedora.

Suponiendo que cuenta con una instancia dentro de ~/VagrantInstances/ llamada 'Buster64' deberá ejecutar lo siguiente:

```shell
    vgserver [up|start] Buster64
```

En caso de haber personalizado sus instancias en el archivo vgserver.sh podrá utilizar el siguiente comando para iniciar todas las instancias a la vez en el orden indicado.

```shell
    vgserver [up|start] [-a|--all]
```


* ## halt / kill

Para detener una instancia existente cuenta con 2 opciones, si es una instancia dentro de la carpeta default '/home/VagrantInstances/' solo deberá utilizar 'halt' o 'kill' indicando el nombre de la carpeta contenedora.

Suponiendo que cuenta con una instancia dentro de ~/VagrantInstances/ llamada 'Buster64' deberá ejecutar lo siguiente:

```shell
    vgserver [halt|kill] Buster64
```

En caso de haber personalizado sus instancias en el archivo vgserver.sh podrá utilizar el siguiente comando para detener todas las instancias a la vez en el orden indicado.

```shell
    vgserver [halt|kill] [-a|--all]
```

* ## reload / restart

Para reiniciar una instancia existente cuenta con 2 opciones, si es una instancia dentro de la carpeta default '/home/VagrantInstances/' solo deberá utilizar 'reload' o 'restart' indicando el nombre de la carpeta contenedora.

Suponiendo que cuenta con una instancia dentro de ~/VagrantInstances/ llamada 'Buster64' deberá ejecutar lo siguiente:

```shell
    vgserver [reload|restart] Buster64
```

En caso de haber personalizado sus instancias en el archivo vgserver.sh podrá utilizar el siguiente comando para reiniciar todas las instancias a la vez en el orden indicado.

```shell
    vgserver [reload|restart] [-a|--all]
```

* ## ssh / connect

Si cuenta con una SSH Key y esta es admitida por la instancia de vagrant, podrá acceder a ella utilizando 'ssh' o 'connect' indicando el puerto configurado en el VagrantFile de la instancia.

Suponiendo que cuenta con una instancia dentro de ~/VagrantInstances/ llamada 'Buster64' y esta escucha al puerto 2222 accederá por medio de:

```shell
    vgserver [ssh|connect] 2222
```

* ## Ayuda


Si desea obtener información breve acerca de los comandos podrá utilizar

```shell
    vgserver [-h|--help]
```

* ## Información

Tome en cuenta que los ejemplos son basados en el alias por defecto 'vgserver', el cual deberá reemplazarlo por su alias personalizado en caso de haberlo configurado al ejecutar el installer o de haberlo editado en el archivo ~/.bashrc.