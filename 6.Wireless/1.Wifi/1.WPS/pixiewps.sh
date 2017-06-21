#!/bin/bash


mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a
cd /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a
git clone https://github.com/wiire-a/pixiewps.git


GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire/pixiewps
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS/
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=pixiewps.desktop

#
cd $GITREPOROOT
cd src
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL