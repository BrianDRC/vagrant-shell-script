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
        cd ~/VagrantInstances/Buster64/ ; vagrant halt;
        cd ~/VagrantInstances/BusterFiles/ ; vagrant halt;
    else
        cd ~/VagrantInstances/$server/ ; vagrant halt;
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
elif [[ $operation == "-h" ]] || [[ $operation == "--help" ]]
then
    echo -e "\n Ayuda acerca del script, reportes o sugerencias https://github.com/BrianDRC/vagrant-shell-script \n
    -h, --help              Ayuda sobre las opciones del script
    up, start               Iniciar servidor, indicar nombre del que desea iniciar (-a o --all para iniciar todos)
    kill, halt              Detener servidor, indicar nombre del que desea iniciar (-a o --all para detener todos)
    ssh, connect            Establecer conexión por SSH al puerto indicado (ex. vgserver ssh 2222 -> Port)
    
    "
elif [[ $operation == "-v" ]] || [[ $operation = "--version" ]]
then
    echo -e "\n Vagrant Control v1.0 \n"
else
    echo -e "\n -h o --help para ayuda sobre las opciones del script \n"
fi