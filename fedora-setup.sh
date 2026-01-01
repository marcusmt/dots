#!/usr/bin/env bash

sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

sudo dnf update -y && sudo dnf upgrade -y

if [ -n "$1" ]; then
    sudo hostnamectl set-hostname --static "$1"
    sudo hostnamectl set-hostname --pretty "$1"
fi

if ! grep -q "vm.swappiness" /etc/sysctl.conf; then
  cat <<EOF | sudo tee -a /etc/sysctl.conf
vm.swappiness=10
vm.vfs_cache_pressure=50
EOF
  sudo sysctl -p
fi
