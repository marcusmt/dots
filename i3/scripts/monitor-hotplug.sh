#!/bin/bash
# Handles monitor plug/unplug events.
# Called via exec_always in i3 config on every i3 start/restart.

EXTERNAL="HDMI-0"
INTERNAL="DP-0"

sleep 1 # let the driver settle after plug/unplug

if xrandr | grep -q "^${EXTERNAL} connected"; then
  # Dual monitor: HDMI-0 left (4K@60Hz), DP-0 right (1440p@240Hz)
  nvidia-settings --assign CurrentMetaMode="\
${EXTERNAL}: 3840x2160_60 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, \
${INTERNAL}: 2560x1440_240 +3840+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
else
  # Single monitor: DP-0 only
  nvidia-settings --assign CurrentMetaMode="\
${INTERNAL}: 2560x1440_240 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
fi
