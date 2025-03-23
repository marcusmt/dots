#!/bin/bash

configure_system() {
  # Add RPMFusion repo
  sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  sudo dnf -y config-manager setopt fedora-cisco-openh264.enabled=1
  sudo dnf install -y akmod-nvidia

  # Ghostty
  dnf copr enable pgdev/ghostty

  sudo dnf update -y && sudo dnf upgrade -y

  sudo dnf install -y --setopt=install_weak_deps=False blueman dunst fish ghostty git hyprland hyprland-qtutils hyprlock hyprpaper network-manager-applet pasystray pavucontrol waybar wl-clipboard wofi xdg-desktop-portal-hyprland

  # Font
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -O $HOME/Downloads/Hack.zip
  mkdir $HOME/.fonts
  unzip $HOME/Downloads/Hack.zip -d $HOME/.fonts
  fc-cache -fv
  rm -rf $HOME/Downloads/Hack.zip

  # Starship Prompt
  curl -sS https://starship.rs/install.sh | sh -s -- -f

  # dots
  cp -r .config/* $HOME/.config
  curl -L https://gruvbox-wallpapers.pages.dev/wallpapers/irl/kace-rodriguez-p3OzJuT_Dks.jpg -o ~/Pictures/wall.jpg
}
