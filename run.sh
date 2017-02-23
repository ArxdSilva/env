#!/bin/bash

set -e
sudo apt-get update
# install git
echo "Installing git..."
sudo apt-get install git
# create ssh
ssh-keygen -t rsa -b 4096 -C "arxdsilva@gmail.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

# install zsh | oh-my-zsh
echo "Installing zsh | oh-my-zsh..."
sudo apt-get install zsh
sudo apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# install go
echo "Installing go..."
sudo apt-add-repository ppa:gophers/archive -y
sudo apt-get update
sudo apt-get install golang-1.8 -y
echo -e "export PATH=$PATH:/usr/lib/go-1.8/bin" |  tee -a ~/.bashrc > /dev/null
export PATH=$PATH:/usr/lib/go-1.8/bin
echo "Adding GOPATH=$GOPATH to ~/.bashrc"
export GOPATH=$HOME/go

sudo apt-get update

# install atom
echo "Installing Atom ..."
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom

# install VB
echo "Installing virtualbox ..."
sudo apt-get install virtualbox
sudo apt install virtualbox-ext-pack

# install vagrant
echo "Installing vagrant ..."
sudo apt-get install vagrant
sudo apt-get install virtualbox-dkms
sudo apt-get update

git config --global core.editor "atom --wait"

echo "Restarting machine ..."
sudo shutdown -r 0
