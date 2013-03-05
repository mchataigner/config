if [ -e ~/.ssh/id_rsa.pub ]; then
  echo "ssh key already exists"
else
  echo "What is your email?"
  read mail
  ssh-keygen -t rsa -C $mail
fi
