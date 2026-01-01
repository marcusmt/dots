#!/usr/bin/env bash

packages=(
  "akmod-nvidia"
  "xorg-x11-drv-nvidia-cuda"
  "vulkan-loader"
  "mesa-vulkan-drivers"
  "libva-nvidia-driver"
  "libva-utils"
)

sudo dnf install -y "${packages[@]}"

cat <<EOF | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF

echo 'force_drivers+=" nvidia nvidia_modeset nvidia_uvm nvidia_drm "' | sudo tee /etc/dracut.conf.d/nvidia.conf

if ! grep -q "nvidia-drm.modeset=1" /proc/cmdline; then
  sudo grubby --update-kernel=ALL --args="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1"
fi

echo "Waiting for NVIDIA kernel module to build..."
sudo akmods --force
until modinfo -F version nvidia &>/dev/null; do
  echo -n "."
  sleep 5
done
echo " done!"

sudo dracut --force

sudo nvidia-smi -pm 1 2>/dev/null || true
sudo nvidia-smi -pl 140 2>/dev/null || true

cat <<EOF | sudo tee /etc/systemd/system/nvidia-performance.service
[Unit]
Description=NVIDIA Performance Settings
After=syslog.target

[Service]
Type=oneshot
ExecStart=/usr/bin/nvidia-smi -pm 1
ExecStart=/usr/bin/nvidia-smi -pl 140

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable nvidia-performance

