#!/bin/bash
wget github.com/mootcube/config/raw/master/.gitconfig

#HOME="/tmp/tmp"

mkdir ~/tmp
cd ~/tmp
git clone https://mootcube@github.com/mootcube/config.git
mv config/.git ~/.git
rm -rf config
cd ~
git reset --hard

