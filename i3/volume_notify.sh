#!/bin/bash
volume_step=0.05
notification_timeout=10000
function get_volume {
  wpctl get-volume @DEFAULT_SINK@ | awk '{printf "%.0f", $2 * 100}'
}

function get_mute {
  wpctl status | grep -A 5 "Sinks:" | grep "*" | grep -q "MUTED"
  if [ $? -eq 0 ]; then
    echo "true"
  else
    echo "false"
  fi
}

function get_volume_icon {
  local volume
  local mute

  volume=$(get_volume)
  mute=$(get_mute)

  if [ "$volume" -eq 0 ] || [ "$mute" == "true" ]; then
    volume_icon=" "
  elif [ "$volume" -lt 50 ]; then
    volume_icon=" "
  else
    volume_icon=" "
  fi
}

function show_volume_notif {
  local volume
  volume=$(get_volume)
  get_volume_icon

  dunstify -t "$notification_timeout" -h string:x-dunst-stack-tag:volume_notif -h int:value:"$volume" "$volume_icon $volume%"
}

show_volume_notif