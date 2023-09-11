#!bin/bash

# --- START of 1st Step --- #

# Upgrade packages
sudo apt-get -y update
sudo apt-get -y upgrade

# Install zsh
sudo apt-get install -y zsh

# Install packages
sudo apt-get install -y curl git openssh-client unzip

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/jirutka/zsh-shift-select ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-shift-select

# Add dotfiles
curl -fsSL https://raw.githubusercontent.com/rodrigomoyano11/dotfiles/main/.zshrc >~/.zshrc

# Change default shell to zsh
chsh --shell $(which zsh)

# Add SSH Keys
eval $(ssh-agent -s)
ssh-add /mnt/c/Users/rodri/.ssh/id_*[^\.pub]

# --- END of 1st Step --- #

# --- Close terminal and reopen --- #

# --- START of 2nd Step --- #

# Install Node.js
curl -fsSL https://fnm.vercel.app/install | zsh
source /home/rodri/.zshrc
fnm install --lts
fnm install --latest

# Install Node.js packages
npm install -g npm pnpm
npm install -g @githubnext/github-copilot-cli

# Auth
github-copilot-cli auth

# --- END of 2nd Step --- #
