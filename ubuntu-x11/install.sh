#!/usr/bin/env bash

ppa_list=(
  "ppa:git-core/ppa"
  "ppa:fish-shell/release-4"
)

packages=(
  "git"
  "fish"
  "fd-find"
  "ripgrep"
  "build-essential"
  "cmake"
  "curl"
  "libfuse2"
)

for ppa in "${ppa_list[@]}"; do
  sudo add-apt-repository -y "$ppa"
done

sudo apt update -y && sudo apt upgrade -y && sudo ubuntu-drivers install && snap-store --quit && sudo snap refresh snap-store

sudo apt install -y "${packages[@]}" --allow-change-held-packages

sudo snap remove firefox
sudo apt autoremove -y

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# 1Password
wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -O $HOME/Downloads/1password.deb
sudo apt -y install $HOME/Downloads/1password.deb
rm $HOME/Downloads/1password.deb

# FD-Find Config
ln -s $(which fdfind) ~/.local/bin/fd

# Nvim
git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $HOME/Downloads/chrome.deb
sudo apt install $HOME/Downloads/chrome.deb

./update.sh
./dwm_install.sh
