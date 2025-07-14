#!/bin/bash/

# RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update @core

# Nvidia
sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf update
sudo dnf install akmod-nvidia-open xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs nvidia-vaapi-driver libva-utils vdpauinfo 

# Install packages
sudo dnf install -y git neovim fzf ripgrep fd alacritty fish blueman pavucontrol pasystray lxappearance picom feh flameshot gnome-themes-extra xkill git 

# Rust
curl https://sh.rustup.rs -sSf | sh
source "$HOME/.config/fish/conf.d/rustup.fish"

# X11
echo "Xft.dpi: 192" | tee $HOME/.Xresources

./update.sh
