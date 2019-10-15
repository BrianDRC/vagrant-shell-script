#! /bin/bash

# Control variables
args=("$@")
operation=${args[0]}
server=${args[1]}

# Start
if [[ $operation == "up" ]] || [[ $operation == "start" ]]
then
    echo -e "\n Vagrant up \n"
    if [[ $server == "--all" ]] || [[ $server == "-a" ]]
    then
        # Editar para agregar más máquinas según cuantas desee, copiar y pegar la linea siguiente cambiando el nombre de la carpeta, según las instancias dentro de su VagrantInstances
        cd ~/VagrantInstances/Buster64/ ; vagrant up;
        cd ~/VagrantInstances/BusterFiles/ ; vagrant up;
    else
        cd ~/VagrantInstances/$server/ ; vagrant up;
    fi
elif [[ $operation == "kill"  ]] || [[ $operation == "halt" ]]
then
    echo -e "\n Vagrant halt \n"
    if [[ $server == "--all" ]] || [[ $server == "-a" ]]
    then
        # Editar para agregar más máquinas según cuantas desee, copiar y pegar la linea siguiente cambiando el nombre de la carpeta, según las instancias dentro de su VagrantInstances
        cd ~/VagrantInstances/Buster64/ ; vagrant halt;
    else
        cd ~/VagrantInstances/$server/ ; vagrant halt;
    fi
elif [[ $operation == "reload"  ]] || [[ $operation == "restart" ]]
then
    echo -e "\n Vagrant restart \n"
    if [[ $server == "--all" ]] || [[ $server == "-a" ]]
    then
        # Editar para agregar más máquinas según cuantas desee, copiar y pegar la linea siguiente cambiando el nombre de la carpeta, según las instancias dentro de su VagrantInstances
        cd ~/VagrantInstances/Buster64/ ; vagrant halt; vagrant up;
    else
        cd ~/VagrantInstances/$server/ ; vagrant halt; vagrant up;
    fi
elif [[ $operation == "ssh" ]] || [[ $operation == "connect" ]] 
then
    echo -e "\n SSH Connection \n"
    port=${args[1]}
    if [[ "$port" =~ ^[0-9]+$ ]]
    then
        echo -e "\n Estableciendo conexión \n"
        ssh vagrant@localhost -p $port
        echo -e "\n"
    else
        echo -e "\n Al intentar conectarse a una instancia Vagrant por SSH debe proveer el número de puerto, verifique la información digitada \n"
    fi
elif [[ $operation == "init" ]] || [[ $operation == "create" ]] 
then
    version=${args[1]}
    folder=${args[2]}
    if [[ $version == "-h" ]] || [[ $version == "--help" ]]
    then
        echo -e " 
    Create Examples \n
    Create a base Vagrantfile                                               vgserver create / init 'debian/buster64' folderName
    Create a minimal Vagrantfile (no comments or helpers)                   vgserver create / init '-m debian/buster64' folderName
    Create a new Vagrantfile, overwriting the one at the current path       vgserver create / init '-f debian/buster64' folderName
    "
    else
        echo -e "\n Creating Instance \n"
        echo -e "\n Creando Máquina $version en /home/VagrantInstances/ \n"
        mkdir ~/VagrantInstances/$folder
        cd ~/VagrantInstances/$folder/; vagrant init $version ; vagrant up ;
        echo -e "\n"
    fi
elif [[ $operation == "-h" ]] || [[ $operation == "--help" ]]
then
    echo -e "\n Ayuda acerca del script, reportes o sugerencias https://github.com/BrianDRC/vagrant-shell-script \n
    -h, --help              Ayuda sobre las opciones del script
    up, start               Iniciar instancia, indicar nombre del que desea iniciar (-a o --all para iniciar todos)
    restart, reload         Reiniciar instancia, indicar nombre del que desea reiniciar (-a o --all para iniciar todos)
    kill, halt              Detener instancia, indicar nombre del que desea detener (-a o --all para detener todos)
    ssh, connect            Establecer conexión por SSH al puerto indicado (ex. vgserver ssh 2222 -> Port)
    init, create            Crear una nueva instancia de Vagrant (vgserver create / init 'version' 'folderName')
    -v, --version           File version
    "
elif [[ $operation == "-v" ]] || [[ $operation = "--version" ]]
then
    echo -e "\n Vagrant Control v2.0 \n"
else
    echo -e "\n -h o --help para ayuda sobre las opciones del script \n"
fi