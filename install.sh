#!bin/bash

# Variables
default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

# Upgrade packages
apt-get -y update
apt-get -y upgrade

# Install zsh
apt-get install -y zsh

# Install packages
apt-get install -y curl git openssh-client unzip

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

# Install Node.js
curl -fsSL https://fnm.vercel.app/install | zsh
source /home/rodri/.bashrc
fnm install --lts
fnm install --latest

# Install Node.js packages
npm install -g npm pnpm @githubnext/github-copilot-cli

# Auth
github-copilot-cli auth
