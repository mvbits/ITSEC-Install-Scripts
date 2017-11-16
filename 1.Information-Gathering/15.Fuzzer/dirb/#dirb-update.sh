#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/seifreed/dirb.git
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed/dirb
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed/dirb/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/15.Fuzzer/
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer
DSKTPFL=dirb.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ ___ ____  ____  
|  _ \_ _|  _ \| __ ) 
| | | | || |_) |  _ \ 
| |_| | ||  _ <| |_) |
|____/___|_| \_\____/ 
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT
#sudo rm  /usr/local/bin/$EXECUTEABLE2
sudo make uninstall
GITRESET

GITSBMDLINIT

./configure
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