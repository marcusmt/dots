#!/usr/bin/fish
# nvidia-verify.fish - Verify NVIDIA configuration on CachyOS

echo "=== NVIDIA Configuration Verification ==="
echo ""

# 1. Check NVIDIA driver version
echo "1. NVIDIA Driver Version:"
nvidia-smi --query-gpu=driver_version --format=csv,noheader
echo ""

# 2. Check loaded NVIDIA kernel modules
echo "2. Loaded NVIDIA Kernel Modules:"
lsmod | grep nvidia
echo ""

# 3. Check GPU details
echo "3. GPU Information:"
nvidia-smi --query-gpu=name,memory.total,power.limit --format=csv,noheader
echo ""

# 4. Verify kernel parameters for NVIDIA
echo "4. Kernel Parameters (checking for nvidia-drm.modeset):"
cat /proc/cmdline | grep -o "nvidia-drm.modeset=[0-9]"
echo ""

# 5. Check if DRM kernel mode setting is enabled
echo "5. DRM Kernel Mode Setting Status:"
sudo cat /sys/module/nvidia_drm/parameters/modeset
echo "(Should be 'Y' for Wayland/Hyprland)"
echo ""

# 6. Verify NVIDIA packages installed
echo "6. Installed NVIDIA Packages:"
paru -Q | grep nvidia
echo ""

# 7. Check Wayland/EGL libraries
echo "7. EGL Wayland Support:"
test -f /usr/lib/libnvidia-egl-wayland.so.1 && echo "✓ EGL Wayland library found" || echo "✗ EGL Wayland library missing"
echo ""

# 8. Verify GBM support (needed for Hyprland)
echo "8. GBM (Generic Buffer Manager) Support:"
test -f /usr/lib/libnvidia-allocator.so.1 && echo "✓ NVIDIA GBM support found" || echo "✗ NVIDIA GBM support missing"
echo ""

# 9. Check NVIDIA power management
echo "9. NVIDIA Power Management:"
cat /proc/driver/nvidia/params | grep "PreserveVideoMemoryAllocations"
echo ""

echo "=== Verification Complete ==="
