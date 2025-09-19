#!/usr/bin/env bash

ppa_list=(
  "ppa:git-core/ppa"
  "ppa:fish-shell/release-4"
)

packages=(
  "git"
  "fish"
  "brightnessctl"
  "libfuse2"
  "build-essential"
  "cmake"
  "curl"
  "mate-polkit"
  "pavucontrol"
  "pasystray"
  "arandr"
  "feh"
  "ksnip"
  "blueman"
  "pavucontrol"
  "pasystray"
)

for ppa in "${ppa_list[@]}"; do
  sudo add-apt-repository -y "$ppa"
done

sudo apt update -y && sudo apt upgrade -y && sudo ubuntu-drivers install && snap-store --quit && sudo snap refresh snap-store

sudo apt install -y "${packages[@]}" --allow-change-held-packages

sudo apt remove -y gnome-terminal gnome-text-editor dunst
sudo snap remove firefox
sudo apt autoremove -y

# Brave
curl -fsS https://dl.brave.com/install.sh | sh

wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -O $HOME/Downloads/1password.deb
sudo apt install $HOME/Downloads/1password.deb

echo "Xft.dpi: 192" | tee $HOME/.Xresources
sudo sed -i "\$aGTK_THEME=\"Adwaita-dark\"" /etc/environment

chmod +x *.sh
./update.sh
