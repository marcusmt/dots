#!/bin/bash

ppa_list=(
  "ppa:git-core/ppa"
  "ppa:fish-shell/release-4"
)

packages=(
  "i3"
  "git"
  "fish"
  "brightnessctl"
  "libfuse2"
  "build-essential"
  "cmake"
  "curl"
  "mate-polkit"
  "blueman"
  "pavucontrol"
  "pasystray"
  "arandr"
  "feh"
  "flameshot"
)

for ppa in "${ppa_list[@]}"; do
  sudo add-apt-repository -y "$ppa"
done

/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2025.03.09_all.deb keyring.deb SHA256:2c2601e6053d5c68c2c60bcd088fa9797acec5f285151d46de9c830aaba6173c
sudo apt install ./keyring.deb
echo "deb [signed-by=/usr/share/keyrings/sur5r-keyring.gpg] http://debian.sur5r.net/i3/ $(grep '^VERSION_CODENAME=' /etc/os-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list

sudo apt update -y && sudo apt upgrade -y && sudo ubuntu-drivers install && snap-store --quit && sudo snap refresh snap-store

sudo apt install -y "${packages[@]}" --allow-change-held-packages

sudo apt remove -y gnome-terminal gnome-text-editor dunst i3lock xss-lock
sudo snap remove firefox
sudo apt autoremove -y

# Chrome
wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' -O $HOME/Downloads/chrome.deb
sudo apt install $HOME/Downloads/chrome.deb
rm -rf $HOME/Downloads/chrome.deb

echo "Xft.dpi: 192" | tee $HOME/.Xresources
sudo sed -i "\$aGTK_THEME=\"Adwaita-dark\"" /etc/environment
wget -O $HOME/Pictures/wall.jpg https://gruvbox-wallpapers.pages.dev/wallpapers/irl/kace-rodriguez-p3OzJuT_Dks.jpg

chmod +x *.sh
./alacritty_install.sh
./dunst_install.sh
./picom_install.sh
./update.sh
