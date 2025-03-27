#!/bin/bash
# Add RPMFusion repo
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf install -y akmod-nvidia

# Wezterm
sudo dnf -y copr enable wezfurlong/wezterm-nightly

sudo dnf update -y && sudo dnf upgrade -y

sudo dnf install -y --setopt=install_weak_deps=False fish git wezterm

# Font
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
mkdir $HOME/.fonts
unzip $HOME/Downloads/Hack.zip -d $HOME/.fonts
fc-cache -fv
rm -rf $HOME/Downloads/Hack.zip

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh -s -- -f

# Zed
curl -f https://zed.dev/install.sh | sh

# Chrome
wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm' -O $HOME/Downloads/chrome.rpm
sudo dnf install $HOME/Downloads/chrome.rpm
rm -rf $HOME/Downloads/chrome.rpm

# dots
cp -r .config/* $HOME/.config
cp .wezterm.lua $HOME/
