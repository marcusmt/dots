#!/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
mkdir $HOME/.fonts
unzip -o $HOME/Downloads/Hack.zip -d $HOME/.fonts
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
sudo rm -rf /opt/nvim
sudo mkdir -p /opt/nvim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz -O $HOME/Downloads/nvim.tar.gz
sudo tar --strip-components=1 -xvf $HOME/Downloads/nvim.tar.gz -C /opt/nvim
rm $HOME/Downloads/nvim.tar.gz

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# EZA
cargo install eza

# Bat
cargo install --locked bat

# Update Apps
./picom.sh

# Dots
cp -r ../fish $HOME/.config/
cp -r ../picom $HOME/.config/
cp -r ../rofi $HOME/.config/
cp -r ../rio $HOME/.config/
