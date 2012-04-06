#!/bin/bash
#HOME="/tmp/tmp"

cd ~
#$HOME
mkdir -p ~/usr
cd ~/usr
rm -rf \
cope \
dfc \


git clone https://mootcube@github.com/mootcube/cope.git
git clone https://mootcube@github.com/mootcube/dfc.git

cd cope
bash setup.sh

cd ../dfc
bash setup.sh

cd ~
chown $USER:$USER -R usr

