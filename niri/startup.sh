#!/usr/bin/env bash

declare -A apps
apps["hyprpolkitagent"]="/usr/lib/hyprpolkitagent/hyprpolkitagent"
apps["swaybg"]="swaybg -i ~/.config/niri/gruv-mistakes.png -m fill"
apps["waybar"]="waybar"
apps["swayosd-server"]="swayosd-server"
apps["xdg-desktop-portal-hyprland"]="/usr/lib/xdg-desktop-portal-hyprland"
apps["wl-clip-persist"]="wl-clip-persist --clipboard regular"
apps["wl-paste"]="wl-paste --watch cliphist store"
apps["swaync"]="swaync"

for app in "${!apps[@]}"; do
  if pgrep -x "$app" >/dev/null; then
    echo "$app is already running."
  else
    echo "Starting $app"
    eval "${apps[$app]}" &
  fi
done
