#!/bin/bash

mkdir -p /opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r
cd /opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r
git clone https://github.com/rofl0r/proxychains-ng

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r/proxychains-ng

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=proxychains-ng.desktop

cd $GITREPOROOT

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
