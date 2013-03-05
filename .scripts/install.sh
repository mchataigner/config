#!/bin/sh

cd $HOME

wget --no-check-certificate https://github.com/mchataigner/config/raw/master/.gitconfig

git clone https://github.com/mchataigner/config.git .mathconfig

mv .mathconfig/* $HOME
mv .mathconfig/.* $HOME

rm -rf .mathconfig
