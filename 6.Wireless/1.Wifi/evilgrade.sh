#!/bin/bash

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/evilgrade/infobyte
cd /opt/ITSEC/6.Wireless/1.Wifi/evilgrade/infobyte
git clone https://github.com/infobyte/evilgrade.git
#
sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/evilgrade/infobyte/evilgrade
EXECUTEABLE1=evilgrade
EXECUTEABLE2=evilgrade.sh
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=evilgrade.desktop
sudo ln -s /opt/ITSEC/6.Wireless/1.Wifi/evilgrade/infobyte/evilgrade/isrcore /etc/perl/isrcore

sudo rm -f /usr/local/bin/$EXECUTEABLE1

#
cd $GITREPOROOT
rm -f evilgrade.sh
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#

echo "#!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/evilgrade/infobyte/evilgrade
./evilgrade


" > evilgrade.sh
sudo chmod +x $EXECUTEABLE1
sudo chmod +x $EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE1
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
