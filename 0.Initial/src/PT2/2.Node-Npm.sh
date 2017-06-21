#!/bin/bash

#Node git install
mkdir -p /opt/DEPS/node/nodejs

cd /opt/DEPS/node/nodejs
git clone https://github.com/nodejs/node
cd node 

make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git checkout v7.x
./configure
make -j 4 
sudo make install
node -v


#NPM git install

mkdir -p /opt/DEPS/npm/npm
cd /opt/DEPS/npm/npm
git clone https://github.com/npm/npm
cd npm

make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git checkout latest
./configure 
make -j 4
sudo make install
npm -v

sudo udpatedb
sudo ldconfig

