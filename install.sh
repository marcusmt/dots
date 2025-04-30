#!/bin/sh

# RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Niri
sudo dnf copr enable yalter/niri

# SwayNC
sudo dnf copr enable erikreider/SwayNotificationCenter

sudo dnf update -y
sudo dnf install -y akmod-nvidia mate-polkit pavucontrol waybar SwayNotificationCenter swaybg
sudo dnf install --setopt=install_weak_deps=False niri

wget https://4kwallpapers.com/images/wallpapers/man-planet-river-3840x2160-15554.jpg -O $HOME/Pictures/wall.jpg
