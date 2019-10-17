#! /bin/bash

# Control variables
operation=$1
server=$2

# Start
if [ $operation == "up" ] || [ $operation == "start" ]; then
    echo " Vagrant up "
    if [ $server == "--all" ] || [ $server == "-a" ]; then
        # Editar para agregar más máquinas según cuantas desee, copiar y pegar la linea siguiente cambiando el nombre de la carpeta, según las instancias dentro de su VagrantInstances
        cd ~/VagrantInstances/vpcli/
        vagrant up
        cd ~/VagrantInstances/vpcolas/
        vagrant up
        cd ~/VagrantInstances/vpweb/
        vagrant up
    else
        cd ~/VagrantInstances/$server/
        vagrant up
    fi
elif [ $operation == "kill" ] || [ $operation == "halt" ]; then
    echo " Vagrant halt "
    if [ $server == "--all" ] || [ $server == "-a" ]; then
        # Editar para agregar más máquinas según cuantas desee, copiar y pegar la linea siguiente cambiando el nombre de la carpeta, según las instancias dentro de su VagrantInstances
        cd ~/VagrantInstances/vpweb/
        vagrant halt
        cd ~/VagrantInstances/vpcolas/
        vagrant halt
        cd ~/VagrantInstances/vpcli/
        vagrant halt
    else
        cd ~/VagrantInstances/$server/
        vagrant halt
    fi
elif [ $operation == "reload" ] || [ $operation == "restart" ]; then
    echo " Vagrant restart "
    if [ $server == "--all" ] || [ $server == "-a" ]; then
        # Editar para agregar más máquinas según cuantas desee, copiar y pegar la linea siguiente cambiando el nombre de la carpeta, según las instancias dentro de su VagrantInstances
        cd ~/VagrantInstances/vpcli/
        vagrant halt
        vagrant up
        cd ~/VagrantInstances/vpcolas/
        vagrant halt
        vagrant up
        cd ~/VagrantInstances/vpweb/
        vagrant halt
        vagrant up
    else
        cd ~/VagrantInstances/$server/
        vagrant halt
        vagrant up
    fi
elif [ $operation == "ssh" ] || [ $operation == "connect" ]; then
    echo " SSH Connection "
    port=$2
    if [ "$port" =~ ^[0-9]+$ ]; then
        echo " Estableciendo conexión "
        ssh vagrant@localhost -p $port
        echo ""
    else
        echo " Al intentar conectarse a una instancia Vagrant por SSH debe proveer el número de puerto, verifique la información digitada "
    fi
elif [ $operation == "init" ] || [ $operation == "create" ]; then
    version=$2
    folder=$3
    if [ $version == "-h" ] || [ $version == "--help" ]; then
        echo " 
    Create Examples
    Create a base Vagrantfile                                               vgserver create / init 'debian/buster64' folderName
    Create a minimal Vagrantfile (no comments or helpers)                   vgserver create / init '-m debian/buster64' folderName
    Create a new Vagrantfile, overwriting the one at the current path       vgserver create / init '-f debian/buster64' folderName
    "
    else
        echo " Creating Instance "
        echo " Creando Máquina $version en /home/VagrantInstances/$folder"
        mkdir ~/VagrantInstances/$folder
        cd ~/VagrantInstances/$folder/
        vagrant init $version
        vagrant up
        echo ""
    fi
elif [ $operation == "-h" ] || [ $operation == "--help" ]; then
    echo " Ayuda acerca del script, reportes o sugerencias https://github.com/BrianDRC/vagrant-shell-script 
    -h, --help              Ayuda sobre las opciones del script
    up, start               Iniciar instancia, indicar nombre del que desea iniciar (-a o --all para iniciar todos)
    restart, reload         Reiniciar instancia, indicar nombre del que desea reiniciar (-a o --all para iniciar todos)
    kill, halt              Detener instancia, indicar nombre del que desea detener (-a o --all para detener todos)
    ssh, connect            Establecer conexión por SSH al puerto indicado (ex. vgserver ssh 2222 -> Port)
    init, create            Crear una nueva instancia de Vagrant (vgserver create / init 'version' 'folderName')
    -v, --version           File version
    "
elif [ $operation == "-v" ] || [ $operation == "--version" ]; then
    echo " Vagrant Control v2.0 "
else
    echo " -h o --help para ayuda sobre las opciones del script "
fi
