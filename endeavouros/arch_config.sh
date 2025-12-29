#!/usr/bin/env bash

packages=(
  "alacritty"
  "fish"
  "brave-browser"
  "noctalia-shell"
  "nvidia-open-dkms"
)

xdg-user-dirs-update

cat >> "$HOME/.bash_profile" << 'EOF'
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec niri --session;
fi
EOF

systemctl --user add-wants hyprland-session.target noctalia.service