#!/bin/bash

mkdir -p /opt/ITSEC/8.Tunnel/udptunnel/astroza
cd /opt/ITSEC/8.Tunnel/udptunnel/astroza
git clone https://github.com/astroza/udptunnel.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/udptunnel/astroza/udptunnel

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=udptunnel.desktop

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

make -j 4

sudo rm -f /usr/local/bin/udptunnel
chmod +x client
sudo ln -s $GITREPOROOT/client /usr/local/bin/udptunnel
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL