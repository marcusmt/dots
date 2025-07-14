#!/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
mkdir $HOME/.fonts
unzip -o $HOME/Downloads/Hack.zip -d $HOME/.fonts
fc-cache -fv
rm $HOME/Downloads/Hack.zip

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Eza
git clone https://github.com/eza-community/eza.git
cd eza
cargo install --path .

# Dots
cp -r i3 ~/.config/
cp -r dunst ~/.config/
cp -r picom ~/.config/
cp -r alacritty ~/.config/
cp -r fish ~/.config/
cp -r gtk-3.0 ~/.config/
cp -r gtk-4-0 ~/.config/