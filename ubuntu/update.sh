#!/usr/bin/env bash

# Font
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
mkdir $HOME/.fonts
unzip -o $HOME/Downloads/Hack.zip -d $HOME/.fonts
fc-cache -fv
rm $HOME/Downloads/Hack.zip

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Zed
curl -f https://zed.dev/install.sh | sh

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# EZA
cargo install eza

# Bat
cargo install --locked bat

# Neovim and its dependencies
wget https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-musl_10.2.0_amd64.deb -O $HOME/Downloads/fd-musl_10.2.0_amd64.deb
sudo apt install $HOME/Downloads/fd-musl_10.2.0_amd64.deb
rm -rf $HOME/Downloads/fd-musl_10.2.0_amd64.deb

wget https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_14.1.1-1_amd64.deb -O $HOME/Downloads/ripgrep_14.1.1-1_amd64.deb
sudo apt install $HOME/Downloads/ripgrep_14.1.1-1_amd64.deb
rm -rf $HOME/Downloads/ripgrep_14.1.1-1_amd64.deb

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo cp -r /opt/nvim-linux-x86_64/share /usr/share
cp nvim.desktop $HOME/.local/share/applications
rm -rf nvim-linux-x86_64.tar.gz

git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git

# Install Apps
./alacritty.sh
./dunst.sh
./i3.sh
./picom.sh

# Dots
cp -r ../alacritty $HOME/.config
cp -r ../dunst $HOME/.config
cp -r ../fish $HOME/.config
cp -r ../i3 $HOME/.config
cp -r ../picom $HOME/.config
cp -r ../xfce4 $HOME/.config
cp -r ../rofi $HOME/.config
