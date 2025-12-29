#!/usr/bin/env bash

packages=(
  "niri"
)

cat >> "$HOME/.bash_profile" << 'EOF'
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec niri --session;
fi
EOF

systemctl --user add-wants hyprland-session.target noctalia.service