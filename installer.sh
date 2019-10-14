#! /bin/bash

args=("$@")
alias=${args[0]}
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd ~/ ; mkdir scripts;
cp $SCRIPTPATH/scripts/vgserver.sh ~/scripts/

if [[ ! -z "$alias" ]]
then
    sudo echo "alias $alias='~/scripts/vgserver.sh'" >> ~/.bashrc
else
    sudo echo "alias vgserver='~/scripts/vgserver.sh'" >> ~/.bashrc
fi
cd ~/
source ~/.bashrc