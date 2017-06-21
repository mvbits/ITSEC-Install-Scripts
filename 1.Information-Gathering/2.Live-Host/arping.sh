#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets
git clone https://github.com/ThomasHabets/arping.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets/arping
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=arping.desktop

cd $GITREPOROOT
make clean 
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
./bootstrap.sh
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL