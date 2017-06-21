#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/eapmd5pass

REPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/eapmd5pass
BINROOT=/opt/ITSEC/6.Wireless/1.Wifi/eapmd5pass/eapmd5pass
VERSION=1.4
EXECUTEABLE1=eapmd5pass
EXECUTEABLE2=eapmd5pass
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=eapmd5pass.desktop

#
sudo rm -f /usr/local/bin/eapmd5pass
cd $REPOROOT
sudo rm -r $BINROOT
wget http://www.willhackforsushi.com/code/eapmd5pass/1.4/eapmd5pass-$VERSION.tgz -O eapmd5pass-$VERSION.tgz
tar xvf eapmd5pass-$VERSION.tgz
sudo rm -f eapmd5pass-$VERSION.tgz
sleep 2
cd $BINROOT
xterm -e "cd /opt/ITSEC/6.Wireless/1.Wifi/eapmd5pass/eapmd5pass && make && exit; bash"

#make -j 4

chmod +x $REPOROOT/eapmd5pass/$EXECUTEABLE1
sudo ln -s $REPOROOT/eapmd5pass/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
