#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/royhills/ike-scan.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan/royhills/ike-scan
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan/royhills/ike-scan/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan/royhills
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host/2.VPN
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/2.VPN
DSKTPFL=ike-scan.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}

echo "${bold}
 ___ _  _______     ____   ____    _    _   _ 
|_ _| |/ / ____|   / ___| / ___|  / \  | \ | |
 | || ' /|  _| ____\___ \| |     / _ \ |  \| |
 | || . \| |__|_____|__) | |___ / ___ \| |\  |
|___|_|\_\_____|   |____/ \____/_/   \_\_| \_|
   
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

sudo make uninstall
make clean
GITRESET

APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT
autoreconf --install
./configure --with-openssl
make -j 4
sudo make install

rm -f $DSKTPFLSDEST/$DSKTPFL
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


