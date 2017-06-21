#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs
cd /opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs
git clone https://github.com/portcullislabs/enum4linux.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs/enum4linux
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFL=enum4linux.desktop

cd $GITREPOROOT
sudo rm -r /usr/local/bin/enum4linux

git clean -f
git fetch origin
git reset --hard origin/master
git pull

chmod +x $GITREPOROOT/enum4linux.pl
sudo ln -s $GITREPOROOT/enum4linux.pl /usr/local/bin/enum4linux

sudo updatedb
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


