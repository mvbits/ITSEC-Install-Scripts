#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/zmap/zmap.git
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap/zmap
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=zmap.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _______  __    _    ____  
|__  /  \/  |  / \  |  _ \ 
  / /| |\/| | / _ \ | |_) |
 / /_| |  | |/ ___ \|  __/ 
/____|_|  |_/_/   \_\_|    
            
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO
cd $GITREPOROOT

make clean
GITSBMDLINIT
mkdir build
cd build
cmake ..
make -j 4
sudo make install 

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
