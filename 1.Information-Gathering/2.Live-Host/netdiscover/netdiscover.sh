#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/alexxy/netdiscover.git
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy/netdiscover
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=netdiscover.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _ _____ _____ ____ ___ ____   ____ _____     _______ ____  
| \ | | ____|_   _|  _ \_ _/ ___| / ___/ _ \ \   / / ____|  _ \ 
|  \| |  _|   | | | | | | |\___ \| |  | | | \ \ / /|  _| | |_) |
| |\  | |___  | | | |_| | | ___) | |__| |_| |\ V / | |___|  _ < 
|_| \_|_____| |_| |____/___|____/ \____\___/  \_/  |_____|_| \_\
        
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO
cd $GITREPOROOT

GITSBMDLINIT

mkdir build
cd build
cmake ..
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL