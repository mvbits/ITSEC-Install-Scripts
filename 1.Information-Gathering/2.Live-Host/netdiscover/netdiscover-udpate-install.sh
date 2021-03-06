#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/alexxy/netdiscover.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy/netdiscover
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy/netdiscover/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=netdiscover.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
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
        
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    

cd $GITREPOROOT
cd build && sudo make uninstall
cd $GITREPOROOT
sudo rm -r build
GITRESET

GITSBMDLINIT
mkdir build
cd build
cmake ..
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi