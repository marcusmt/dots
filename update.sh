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

# Dots
cp -r alacritty ~/.config/
cp -r dunst ~/.config/
cp -r fish ~/.config/
cp -r i3 ~/.config/
cp -r picom ~/.config/
cp -r zed ~/.config/
