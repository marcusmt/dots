#!/usr/bin/env bash

# RustUp update
rustup update

# Font
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
mkdir $HOME/.fonts
unzip -o $HOME/Downloads/Hack.zip -d $HOME/.fonts
fc-cache -fv
rm $HOME/Downloads/Hack.zip

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# EZA
cargo install eza

# Bat
cargo install bat

# Ripgrep
cargo install ripgrep

# FD
cargo install fd-find

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Neovim
mkdir $HOME/.local/share/nvim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz -O $HOME/Downloads/nvim.tar.gz
tar --strip-components=1 -xvf $HOME/Downloads/nvim.tar.gz -C $HOME/.local/share/nvim
rm $HOME/Downloads/nvim.tar.gz

cp -r alacritty/ $HOME/.config/
cp -r fish/ $HOME/.config/
