if [ -e ~/.ssh/id_rsa.pub ]; then
  echo "ssh key already exists"
else
  echo "What is your email?"
  read mail
  ssh-keygen -t rsa -C $mail
fi

if [ -e "$(which xclip)" ]; then
  echo -n ""
else
  sudo apt-get install xclip
fi

xclip -sel clip < ~/.ssh/id_rsa.pub


echo "copy to github"

read toto
