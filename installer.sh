#! /bin/bash

args=("$@")
alias=${args[0]}
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd ~/ ; 
echo -e " Creando directorio en /home/ \n"
mkdir scripts ;
echo -e " Copiando archivos a /home/scripts/ \n"
cp $SCRIPTPATH/scripts/vgserver.sh ~/scripts/ ; 
cd ~/scripts/ ; 
echo -e " Otorgando Permisos \n"
sudo chmod 777 vgserver.sh ;

echo -e " Configurando alias \n"
if [[ ! -z "$alias" ]]
then
    sudo echo "alias $alias='~/scripts/vgserver.sh'" >> ~/.bashrc
else
    sudo echo "alias vgserver='~/scripts/vgserver.sh'" >> ~/.bashrc
fi

cd ~/ ;

echo -e " Para finalizar, ejecutar 'source ~/.bashrc' \n"
if [[ ! -z "$alias" ]]
then
echo -e " Para información utilice '$alias -h' \n"
else
echo -e " Para información utilice 'vgserver -h' \n"
fi