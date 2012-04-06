wget github.com/mootcube/config/raw/master/.gitconfig

HOME="/tmp/tmp"

mkdir /tmp/tmp
cd /tmp/tmp
git clone https://mootcube@github.com/mootcube/config.git
mv config/.git $HOME/.git
rm -rf config
cd $HOME
git reset --hard

