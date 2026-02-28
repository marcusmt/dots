#!/bin/bash
# Polls for HDMI connection and lid state changes and reconfigures displays.
# Start once from i3 config: exec --no-startup-id ~/.config/i3/scripts/monitor-watch.sh

EXTERNAL="HDMI-0"
INTERNAL="DP-0"
LOCKFILE="/tmp/monitor-watch.lock"
POLL_INTERVAL=2

# Prevent duplicate instances
if [ -e "$LOCKFILE" ]; then
    OLD_PID=$(cat "$LOCKFILE")
    kill "$OLD_PID" 2>/dev/null
fi
echo $$ > "$LOCKFILE"
trap "rm -f $LOCKFILE" EXIT

lid_is_closed() {
    local state_file
    state_file=$(ls /proc/acpi/button/lid/*/state 2>/dev/null | head -1)
    [ -n "$state_file" ] && grep -q "closed" "$state_file"
}

apply_dual() {
    xrandr --output "${INTERNAL}" --primary
    nvidia-settings --assign CurrentMetaMode="\
${EXTERNAL}: 3840x2160_60 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, \
${INTERNAL}: 2560x1440_240 +3840+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
}

apply_single() {
    xrandr --output "${INTERNAL}" --primary
    nvidia-settings --assign CurrentMetaMode="\
${INTERNAL}: 2560x1440_240 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
    i3-msg restart 2>/dev/null
}

apply_external_only() {
    xrandr --output "${EXTERNAL}" --primary
    nvidia-settings --assign CurrentMetaMode="\
${EXTERNAL}: 3840x2160_60 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
    i3-msg restart 2>/dev/null
}

PREV_STATE=""

while true; do
    EXTERNAL_CONNECTED=false
    lid_is_closed && LID_CLOSED=true || LID_CLOSED=false
    xrandr | grep -q "^${EXTERNAL} connected" && EXTERNAL_CONNECTED=true

    if $EXTERNAL_CONNECTED && $LID_CLOSED; then
        STATE="external_only"
    elif $EXTERNAL_CONNECTED; then
        STATE="dual"
    else
        STATE="single"
    fi

    if [ "$STATE" != "$PREV_STATE" ]; then
        sleep 1  # let the driver settle
        case "$STATE" in
            dual)          apply_dual ;;
            single)        apply_single ;;
            external_only) apply_external_only ;;
        esac
        PREV_STATE="$STATE"
    fi

    sleep "$POLL_INTERVAL"
done
