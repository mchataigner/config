#!/bin/sh

cd $HOME

wget --no-check-certificate https://github.com/mchataigner/config/raw/master/.gitconfig

wget --no-check-certificate https://github.com/mchataigner/config/raw/master/.script/genkey.sh -O - | sh

wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

git clone git@github.com:mchataigner/config.git .mathconfig

rsync -av .mathconfig/ $HOME

rm -rf .mathconfig

wget --no-check-certificate https://github.com/mchataigner/config/raw/master/.gitconfig

~/.scripts/genkey.sh

mkdir -p ~/opt ~/bin ~/usr 

git submodule init .fonts/ubuntu-mono-powerline
git submodule update .fonts/ubuntu-mono-powerline

git submodule init opt/cope
git submodule update opt/cope
./opt/cope/setup.sh

git submodule init opt/dfc
git submodule update opt/dfc
./opt/dfc/setup.sh
