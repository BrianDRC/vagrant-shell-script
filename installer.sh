#! /bin/bash

alias=$1
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd ~/
echo " Creando directorio en /home/ \n"
mkdir scripts
mkdir VagrantInstances
echo " Copiando archivos a /home/scripts/ \n"
cp $SCRIPTPATH/scripts/vgserver.sh ~/scripts/
cd ~/scripts/
echo " Otorgando Permisos \n"
sudo chmod 777 vgserver.sh

echo " Configurando alias \n"
if [ ! -z "$alias" ]; then
    sudo echo "alias $alias='~/scripts/vgserver.sh'" >>~/.bashrc
else
    sudo echo "alias vgserver='~/scripts/vgserver.sh'" >>~/.bashrc
fi

cd ~/

echo " Para finalizar, ejecutar 'source ~/.bashrc' \n"
if [ ! -z "$alias" ]; then
    echo " Para información utilice '$alias -h' \n"
else
    echo " Para información utilice 'vgserver -h' \n"
fi
