#!/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
mkdir $HOME/.fonts
unzip $HOME/Downloads/Hack.zip -d $HOME/.fonts
fc-cache -fv
rm $HOME/Downloads/Hack.zip

#FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

#Neovim and its dependencies
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Dots
cp -r niri ~/.config/
cp -r swaync ~/.config/
cp -r waybar ~/.config/
