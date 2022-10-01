
mkdir ~/3D-scanner
cd ~/3D-scanner
mkdir ~/bqlabs
cd bqlabs/
mkdir horus
cd horus/

# install packages needed to build a debian package
sudo apt install build-essential devscripts

# remove old repository to preven error "The repository does not have a Release file"
sudo apt-add-repository -r ppa:bqlabs/horus-dev


apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BC80FC18B81F47A53475B47D69238A55545A3FCF

#sudo nano /etc/apt/sources.list.d/horus.list
##https://linuxize.com/post/linux-tee-command/#using-tee-in-conjunction-with-sudo
touch nano /etc/apt/sources.list.d/horus.list
echo "deb-src https://ppa.launchpadcontent.net/bqlabs/horus-dev/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/horus.list

sudo apt update
mkdir horus_manual_build
cd horus_manual_build/

sudo apt install python-all python-setuptools debhelper dh-python


# build debian package:
apt source -t xenial --build horus


# install debian package:
sudo dpkg -i *.deb

# try to fix dependency errors fails:
#sudo apt install python-serial python-wxgtk3.0 python-opengl python-pyglet python-numpy python-scipy python-matplotlib python-opencv avrdude libftdi1 v4l-utils
##sudo apt search python-serial
##sudo apt search python-wxgtk3.0
##sudo apt search wxgtk

# Install virtual environment
sudo apt install python3-virtualenv

# Fix apt issues by removing defective package "horus"
sudo apt --fix-broken install


# Create a virtual environment with python2
virtualenv -p /usr/bin/python2 virenv

source virenv/bin/activate
python -V



# fix dpkg -i issues
sudo apt-get install -f
sudo apt install python2-dev


# Change "python" to "python2" in file "horus-0.2rc1.2/debian/control":
#Depends: ${misc:Depends}, ${python:Depends}, python2, python-serial, python-wxgtk2.8 | pytho>






  187  dpkg -x horus_0.2rc1.2-xenial1_arm64.deb horus-0.2rc1.2
  188  dpkg -e horus-0.2rc1.2/debian
  189  dpkg -e horus_0.2rc1.2-xenial1_arm64.deb horus-0.2rc1.2/debian
  190  nano horus-0.2rc1.2/debian/control 
  191  ls
  192  dpkg -p horus-0.2rc1.2 new_horus_0.2rc1.2-xenial1_arm64.deb
  193  ls
  194  dpkg -b horus-0.2rc1.2 new_horus_0.2rc1.2-xenial1_arm64.deb
  195  cd horus-0.2rc1.2
  200  mkdir horus-0.2rc1.2/DEBIAN
  201  cd horus-0.2rc1.2/DEBIAN
  202  ln -s ../debian/control ./
  203  cd ../..
  204  dpkg -b horus-0.2rc1.2 new_horus_0.2rc1.2-xenial1_arm64.deb
