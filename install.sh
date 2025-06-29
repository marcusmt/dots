#!/bin/sh

# RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update @core

# Niri
sudo dnf copr enable yalter/niri-git
echo "priority=1" | sudo tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

# SwayNC
sudo dnf copr enable erikreider/SwayNotificationCenter

sudo dnf update -y
sudo dnf install -y akmod-nvidia-open nvidia-vaapi-driver libva-utils vdpauinfo mate-polkit pavucontrol waybar SwayNotificationCenter swaybg nm-applet blueman fish alacritty

curl -fsSL https://raw.githubusercontent.com/sannidhyaroy/updates-server/refs/heads/feat/root-installat
ion/install-as-root.sh | sudo bash
bash <(curl -s https://raw.githubusercontent.com/sannidhyaroy/updates-server/refs/heads/feat/root-installation/1password-integration.sh)

cp wall.jpg $HOME/Pictures/wall.jpg
