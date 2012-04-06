HOME="/tmp/tmp"

cd $HOME
mkdir usr
cd usr
git clone https://mootcube@github.com/mootcube/cope.git
git clone https://mootcube@github.com/mootcube/dfc.git

cd cope
sh setup.sh
make
sudo make install

cd ../dfc
make
sudo make install

cd ..
