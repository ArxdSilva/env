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
curl -LO https://get.golang.org/$(uname)/go_installer && chmod +x go_installer && ./go_installer && rm go_installer
sudo apt-get update

# install vs code
echo "Installing Code ..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code # or code-insiders

git config --global core.editor "code --wait"

echo "Restarting machine ..."
sudo shutdown -r 0
