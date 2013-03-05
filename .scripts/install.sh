#!/bin/sh

cd $HOME

wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

wget --no-check-certificate https://github.com/mchataigner/config/raw/master/.gitconfig

git clone https://github.com/mchataigner/config.git .mathconfig

rsync -av .mathconfig/ $HOME

rm -rf .mathconfig



