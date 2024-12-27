# Contact: nurahmedomar@gmail.com
# Date: 2024-12-27

sudo apt update
sudo apt -y install yosys
#######################################################
#	Installing openPDK and sky130nm
########################################################

## fetch the repository with git:
cd ~/eda_tools/
## fetch the repository with git:
git clone git://opencircuitdesign.com/open_pdks
cd open_pdks
## configure the build, a --prefix option can be given to install
## in a different place, by default after installation a 
## /usr/local/share/pdk directory is created if no --prefix is provided.
## Below line for example requests installation in my home directory
## (/home/schippes/share/pdk):
## ./configure --enable-sky130-pdk --prefix=/home/schippes
## Do the following steps one at a time and ensure no errors are
##  reported after each step.
./configure --enable-sky130-pdk 
sudo make
sudo make install 
cd ..

#integrate sky130 to magic 
sudo ln -s /usr/local/share/pdk/sky130A/libs.tech/magic/* /usr/local/lib/magic/sys
#magic -T sky130A

## First test of trying example circuits in sky130 
mkdir test_xschem_sky130
cd test_xschem_sky130
echo 'source /usr/local/share/pdk/sky130B/libs.tech/xschem/xschemrc' > ./xschemrc
xschem


## install xterm to free linux terminal for other operations
sudo apt-get install xterm
## set terminal xterm
set terminal gnome-terminal
