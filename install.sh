#!bin/bash

# Install zsh
apt-get install -y zsh

# Install packages
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y openssh-client

# Change default shell to zsh
chsh --shell $(which zsh) $(whoami)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/jirutka/zsh-shift-select ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-shift-select

# Upgrade packages
apt-get -y update
apt-get -y upgrade

# Install Node.js
curl - fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs

# Install Node.js packages
npm install -g npm pnpm
npm i -g @githubnext/github-copilot-cli

# Add dotfiles
curl -fsSL https://raw.githubusercontent.com/rodrigomoyano11/dotfiles/main/dot_zshrc >~/.zshrc
zsh
