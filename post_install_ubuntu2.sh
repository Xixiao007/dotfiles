#!/bin/bash

cd ~/Download
# update system
sudo apt-get update
sudo apt-get upgrade -y

# copy dotfiles
 git clone https://github.com/Xixiao007/dotfiles-ubuntu.git ${HOME}/dotfiles
 chmod +x ${HOME}/dotfiles/bootstrap.sh && ${HOME}/bootstrap.sh
 cd ${HOME}/dotfiles
 git remote rm origin
 git remote add origin git@github.com:Xixiao007/dotfiles-ubuntu.git

# GPU 1080 driver
# echo -e 'blacklist amd76x_edac\nblacklist vga16gb\nblacklist nouveau\nblacklist rivafb\nblacklist nvidiafb\nblacklist rivatv' | sudo tee --append /etc/modprobe.d/blacklist.conf
# sudo apt-get purge nvidia-*
# sudo apt autoremove
# sudo shutdown -r now
# sudo add-apt-repository ppa:graphics-drivers/ppa -y
# sudo apt-get update -y
# sudo apt-get install nvidia-367 -y
# sudo apt-get install mesa-common-dev -y
# sudo apt-get install freeglut3-dev -y
