#!/bin/sh

cd $HOME

wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

wget --no-check-certificate https://github.com/mchataigner/config/raw/master/.gitconfig

git clone --recursive https://github.com/mchataigner/config.git .mathconfig

rsync -av .mathconfig/ $HOME

rm -rf .mathconfig

if [ -e ~/.ssh/id_rsa.pub ];then
  echo "ssh key already exists"
else
  read -p "What is your email?" mail

  ssh-keygen -t rsa -C $mail
fi

sudo apt-get install xclip

xclip -sel clip < ~/.ssh/id_rsa.pub
