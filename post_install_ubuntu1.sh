#!/bin/bash
SSH_COMMENT="home_ubuntu"
cd ~/Download

#system preparation
sudo apt-get update
sudo apt-get upgrade -y

# ssh key
mkdir ~/.ssh
ssh-keygen -t rsa -b 4096 -C $SSH_COMMENT -N "" -f ${HOME}/.ssh/id_rsa

# small toolkits
sudo apt-get install tree -y

# git
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y

# tmux
sudo apt-get install tmux

# Vim
sudo apt-get install vim -y

# Chrome 64bit
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y

# Fish shell
sudo apt-add-repository ppa:fish-shell/release-2 -y
sudo apt-get update
sudo apt-get install fish -y
h -s `which fish`
# fishman
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
rm ~/.fzf -rf
  
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
/usr/bin/fish
fisher fnm fzf


# i3
sudo apt-get install conky-all -y
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee --append /etc/apt/sources.list.d/sur5r-i3.list
sudo apt-get update
sudo apt-get install i3 feh scrot -y

# vsc
wget -O vsc.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i ./vsc.deb
sudo apt-get install -f
