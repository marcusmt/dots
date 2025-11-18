#!/usr/bin/env bash
brightness_step=100
notification_timeout=10000
backlight_device="intel_backlight"

function get_brightness_raw {
  brightnessctl -d "$backlight_device" | grep -oP 'Current brightness: \K\d+'
}

function get_max_brightness_raw {
  brightnessctl -d "$backlight_device" | grep -oP 'Max brightness: \K\d+'
}

function get_brightness_percent {
  local current_raw=$(get_brightness_raw)
  local max_raw=$(get_max_brightness_raw)

  if [ -z "$max_raw" ] || [ "$max_raw" -eq 0 ]; then
    echo 0
    return
  fi
  awk "BEGIN {printf \"%.0f\", ($current_raw * 100) / $max_raw}"
}

function show_brightness_notif {
  local brightness_percent
  brightness_percent=$(get_brightness_percent)
  dunstify -t "$notification_timeout" -h string:x-dunst-stack-tag:brightness_notif -h int:value:"$brightness_percent" "󰃟 $brightness_percent%" # Brightness icon (Unicode: U+F64F)
}

case "$1" in
brightness_up)
  current_brightness_raw=$(get_brightness_raw)
  max_brightness_raw=$(get_max_brightness_raw)
  upValue=$((current_brightness_raw + brightness_step))
  upValue=$((upValue > max_brightness_raw ? max_brightness_raw : upValue))
  brightnessctl -d "$backlight_device" set "$upValue" && show_brightness_notif || notify-send "Error setting brightness"
  ;;

brightness_down)
  current_brightness_raw=$(get_brightness_raw)
  downValue=$((current_brightness_raw - brightness_step))
  downValue=$((downValue < 0 ? 0 : downValue))
  brightnessctl -d "$backlight_device" set "$downValue" && show_brightness_notif || notify-send "Error setting brightness"
  ;;

*)
  echo "Usage: $0 {brightness_up|brightness_down}"
  exit 1
  ;;
esac
