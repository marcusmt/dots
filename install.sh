#!/bin/sh

# RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update -y @core

# Niri
sudo dnf copr enable yalter/niri-git
echo "priority=1" | sudo tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

# SwayNC
sudo dnf copr enable erikreider/SwayNotificationCenter

sudo dnf update -y
sudo dnf install -y akmod-nvidia-open nvidia-vaapi-driver libva-utils vdpauinfo fuzzel swayidle swaylock mate-polkit pavucontrol waybar SwayNotificationCenter swaybg nm-applet blueman fish alacritty lxappearance fd-find ripgrep
sudo dnf install -y niri --setopt=install_weak_deps=False

# Zen Browser
bash <(curl -s https://raw.githubusercontent.com/sannidhyaroy/updates-server/refs/heads/feat/root-installation/1password-integration.sh)

# Brave
curl -fsS https://dl.brave.com/install.sh | sh

# Rust
curl https://sh.rustup.rs -sSf | sh
. "$HOME/.cargo/env"

cp wall.jpg $HOME/Pictures/wall.jpg

./update.sh
