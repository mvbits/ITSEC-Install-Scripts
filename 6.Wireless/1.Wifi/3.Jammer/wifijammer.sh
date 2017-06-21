#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/wifijammer/DanMcInerney
cd /opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/wifijammer/DanMcInerney
git clone https://github.com/DanMcInerney/wifijammer.git


GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/wifijammer/DanMcInerney/wifijammer
EXECUTEABLE1=wifijammer.py
EXECUTEABLE2=wifijammer
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/3.Jammer
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/3.Jammer
DSKTPFL=wifijammer.desktop

#
cd $GITREPOROOT

sudo rm /usr/local/bin/$EXECUTEABLE2

#sudo update
#sudo apt-get upgrade
sudo updatedb
sudo ldconfig

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
