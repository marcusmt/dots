#!/bin/bash
vol_info=$(wpctl get-volume @DEFAULT_SINK@)
volume=$(awk '{printf "%.0f", $2 * 100}' <<< "$vol_info")

if [[ "$vol_info" == *"[MUTED]"* ]] || [ "$volume" -eq 0 ]; then
  icon=" "
elif [ "$volume" -lt 50 ]; then
  icon=" "
else
  icon=" "
fi

dunstify -t 10000 -h string:x-dunst-stack-tag:volume_notif -h int:value:"$volume" "$icon $volume%"
