# Contact: nurahmedomar@gmail.com
# Date: 2024-12-27

# This script was tested in Ubuntu 24.04.1 LTS which was installed on VirtualBox-7.1.4

#######################################################
#STEP:1 Download pre-requiste tools
#######################################################

sudo apt-get update
mkdir -p eda_tools
cd eda_tools
echo "installing pre-requisite"
echo "___________________________________________________"
sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev \
	make m4 tcsh csh libx11-dev gperf  tcl8.6-dev tk8.6 tk8.6-dev \
	libxmp4 libxpm-dev  libxcb1 libcairo2  \
      libxrender-dev libx11-xcb-dev libxaw7-dev freeglut3-dev automake yosys
sudo apt-get update
sudo apt-get -y install libtool

#######################################################
#STEP:2 Installing xschem
########################################################

cd ~/eda_tools/
git clone https://github.com/StefanSchippers/xschem.git xschem-src
cd xschem-src
./configure 
make 
sudo make install 
cd ..

#######################################################
#STEP:3 Installing magic VLSI
########################################################

cd ~/eda_tools/ 
git clone git://opencircuitdesign.com/magic
cd magic 
./configure
make 
sudo make install 
cd ..

#######################################################
#STEP:4 Installing ngspice
########################################################

cd ~/eda_tools/
git clone https://git.code.sf.net/p/ngspice/ngspice ngspice_git
cd ngspice_git
mkdir release
## in order to run the following you must have adms installed (sudo apt-get install adms)
sudo apt-get install adms
./autogen.sh
cd release
## by default if no --prefix is provided ngspice will install under /usr/local/{bin,share,man,lib}
## you can add a --prefix=/home/username to install into your home directory.
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp --enable-adms
## build the program
sudo make
## install the program and needed files.
sudo make install
cd ..


#####################################
Gaw download link
#####################################
https://www.rvq.fr/php/ndl.php?id=gaw.?-.*

#######################
pre-requisite
#######################
sudo apt install libgtk-3-dev

