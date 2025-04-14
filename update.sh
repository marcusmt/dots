#!/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
mkdir $HOME/.fonts
unzip $HOME/Downloads/Hack.zip -d $HOME/.fonts
fc-cache -fv
rm $HOME/Downloads/Hack.zip

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Zed
curl -f https://zed.dev/install.sh | sh

#FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

#Neovim and its dependencies
wget https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-musl_10.2.0_amd64.deb -O $HOME/Downloads/fd-musl_10.2.0_amd64.deb
sudo apt install $HOME/Downloads/fd-musl_10.2.0_amd64.deb
wget https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_14.1.1-1_amd64.deb -O $HOME/Downloads/ripgrep_14.1.1-1_amd64.deb
sudo apt install $HOME/Downloads/ripgrep_14.1.1-1_amd64.deb
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Dots
cp -r alacritty ~/.config/
cp -r dunst ~/.config/
cp -r fish ~/.config/
cp -r i3 ~/.config/
cp -r picom ~/.config/
cp -r zed ~/.config/
