#!/bin/sh

curl -sS https://starship.rs/install.sh | sh -s -- -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
cd 1password
makepkg -si

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si