#!/bin/bash
case "$1" in
  brightness_up)   brightnessctl set 100+ > /dev/null ;;
  brightness_down) brightnessctl set 100- > /dev/null ;;
  *) echo "Usage: $0 {brightness_up|brightness_down}"; exit 1 ;;
esac || { notify-send "Brightness error" "Failed to set brightness"; exit 1; }

percent=$(brightnessctl -m | awk -F',' '{printf "%d", $5}')
dunstify -t 10000 -h string:x-dunst-stack-tag:brightness_notif -h int:value:"$percent" "󰃟 $percent%"
