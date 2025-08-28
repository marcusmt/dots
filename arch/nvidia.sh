#!/usr/bin/env bash
sudo sed -i '/^#\[multilib\]/,/^#Include/ s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm
paru -S --needed nvidia-open-dkms linux-headers nvidia-utils lib32-nvidia-utils egl-wayland libva-nvidia-driver
echo "options nvidia_drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf >/dev/null
sudo mkinitcpio -P
