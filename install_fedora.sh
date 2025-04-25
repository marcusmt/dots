#!/bin/sh

# RPM Fusion Repo
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# Hyprland
sudo dnf -y copr enable solopasha/hyprland

sudo dnf -y update

sudo dnf -y install akmod-nvidia

sudo dnf -y install --setopt=install_weak_deps=False hyprland xdg-desktop-portal-hyprland 

sudo dnf -y install brightnessctl hyprland-qtutils nwg-panel \
ripgrep wl-clipboard wofi hyprpolkitagent \
hyprpaper fish fd-find code

chmod +x *.sh
./alacritty_install.sh
./update_fedora.sh

