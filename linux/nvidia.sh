#!/usr/bin/env bash

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update @core
sudo dnf install rpmfusion-nonfree-release-tainted

sudo dnf install akmod-nvidia-open xorg-x11-drv-nvidia-cuda vulkan xorg-x11-drv-nvidia-cuda-libs libva-nvidia-driver libva-utils vdpauinfo
