#!/bin/bash
set -e

[[ $EUID -ne 0 ]] && { echo "Run with sudo"; exit 1; }

# Check driver
nvidia-smi --query-gpu=name,driver_version --format=csv,noheader || { echo "NVIDIA driver not found"; exit 1; }

# Fix /etc/kernel/cmdline
CMDLINE="/etc/kernel/cmdline"
[[ ! -f "$CMDLINE" ]] && { echo "$CMDLINE missing"; exit 1; }

CURRENT=$(cat "$CMDLINE")
UPDATED="$CURRENT"

echo "$CURRENT" | grep -q "nvidia_drm.modeset=1" || UPDATED="$UPDATED nvidia_drm.modeset=1"
echo "$CURRENT" | grep -q "nvidia_drm.fbdev=1" || UPDATED="$UPDATED nvidia_drm.fbdev=1"

if [[ "$CURRENT" != "$UPDATED" ]]; then
    cp "$CMDLINE" "$CMDLINE.backup.$(date +%Y%m%d-%H%M%S)"
    echo "$UPDATED" > "$CMDLINE"
    echo "Updated $CMDLINE - run: sudo reinstall-kernels && sudo reboot"
fi

# Fix /etc/modprobe.d/nvidia.conf
MODPROBE="/etc/modprobe.d/nvidia.conf"
cat > "$MODPROBE" << 'EOF'
options nvidia_drm modeset=1 fbdev=1
options nvidia NVreg_PreserveVideoMemoryAllocations=1
EOF

# Check if active
cat /proc/cmdline | grep -q "nvidia_drm.modeset=1" && echo "✓ Active" || echo "✗ Reboot needed"
