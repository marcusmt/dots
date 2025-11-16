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

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Neovim and its dependencies
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

# Helium
sudo rm -rf /opt/helium/
sudo mkdir /opt/helium
URL=$(wget -qO- https://api.github.com/repos/imputnet/helium-linux/releases/latest |
  grep "browser_download_url.*x86_64_linux\.tar\.xz" |
  sed -E 's/.*"browser_download_url": "(.*)".*/\1/')
FILE_PATH="$HOME/Downloads/helium-latest.tar.xz"
wget -q -O "$FILE_PATH" "$URL"
sudo tar --strip-components=1 -xvf "$FILE_PATH" -C /opt/helium/
rm "$FILE_PATH"
sudo cp /opt/helium/helium.desktop /usr/share/applications/
sudo cp ../helium-browser /etc/apparmor.d/
sudo apparmor_parser -a /etc/apparmor.d/helium-browser
sudo systemctl reload apparmor

# Dots
cp -r ../fish $HOME/.config/
