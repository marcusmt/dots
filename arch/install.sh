#!/usr/bin/env fish

# Define os arrays de pacotes
set packages_x11 nwg-look i3 plasma-x11-session dunst picom feh
set packages_wayland hypridle hyprlock wl-clip-persist grim slurp xwaylandvideobridge-git xdg-desktop-portal-hyprland swaybg swaync waybar swayosd-git qt5-wayland qt6-wayland wofi hyprshot wlogout
set packages_common qt6ct gnome-themes-extra ttf-hack-nerd brightnessctl eza ghostty-git

# Instala o Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Instala o Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Instala os pacotes com paru
paru -S $packages_wayland $packages_common --noconfirm

# Copia os arquivos de configuração
cp -r ../hypr $HOME/.config
cp -r ../swaync $HOME/.config
cp -r ../waybar $HOME/.config
cp -r ../wofi $HOME/.config
cp -r ../fish $HOME/.config

echo "Instalação concluída!"
