#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__        _____ _____ ___ ____  _   _ __  __ ____  _  _____ _   _ 
\ \      / /_ _|  ___|_ _|  _ \| | | |  \/  |  _ \| |/ /_ _| \ | |
 \ \ /\ / / | || |_   | || |_) | | | | |\/| | |_) | ' / | ||  \| |
  \ V  V /  | ||  _|  | ||  __/| |_| | |  | |  __/| . \ | || |\  |
   \_/\_/  |___|_|   |___|_|    \___/|_|  |_|_|   |_|\_\___|_| \_|
         
${normal}"

sudo rm -r /opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs/WiFi-Pumpkin
mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs
cd /opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs

git clone https://github.com/P0cL4bs/WiFi-Pumpkin.git

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs/WiFi-Pumpkin
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=wifipumpkin.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
sed -i -e 's/pip install /sudo -H pip2 install /g' installer.sh
sed -i -e 's/scapy hostapd rfkill/scapy rfkill/g' installer.sh
sed -i -e 's/pip install /sudo -H pip2 install /g' make_deb.sh
sed -i -e 's/scapy hostapd rfkill/scapy rfkill/g' make_deb.sh
chmod +x installer.sh
chmod +x make_deb.sh

sudo ./make_deb.sh
cd /opt/ITSEC/6.Wireless/1.Wifi/wifi-pumpkin/P0cL4bs/WiFi-Pumpkin/deb_tmp/
sudo bash -c 'for DEBWP in $(ls wifi-pumpkin_*); do sudo dpkg -i $DEBWP;done'

rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL