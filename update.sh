#!/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
mkdir $HOME/.fonts
unzip -o $HOME/Downloads/Hack.zip -d $HOME/.fonts
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

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Zen
curl -fsSL https://raw.githubusercontent.com/sannidhyaroy/updates-server/refs/heads/feat/root-installation/install-as-root.sh | sudo bash

# Eza
git clone https://github.com/eza-community/eza.git
cd eza
cargo install --path .

# Dots
cp -r niri ~/.config/
cp -r swaync ~/.config/
cp -r waybar ~/.config/
cp -r alacritty ~/.config/
cp -r fish ~/.config/
