#!/usr/bin/env bash

packages=(
  "git"
  "fish"
  "sway"
  "alacritty"
  "iwl*-firmware"
  "akmod-nvidia"
  "xorg-x11-drv-nvidia-cuda"
  "egl-gbm"
  "vulkan-loader"
  "mesa-vulkan-drivers"
  "libva-nvidia-driver"
  "libva-utils"
  "tuned"
  "kernel-tools"
  "lm_sensors"
  "NetworkManager-tui"
  "mate-polkit.x86_64"
  "gnome-themes-extra"
  "papirus-icon-theme"
  "mako"
)

# RPM Fusion repos
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

sudo dnf update -y && sudo dnf upgrade -y
sudo dnf install -y "${packages[@]}"

# Codecs - check if already swapped
if rpm -q ffmpeg-free &>/dev/null; then
  sudo dnf swap ffmpeg-free ffmpeg --allowerasing
fi

sudo dnf install -y \
  gstreamer1-plugins-{bad-\*,good-\*,base} \
  gstreamer1-libav \
  gstreamer1-plugin-openh264 \
  mozilla-openh264 \
  --exclude=gstreamer1-plugins-bad-free-devel

sudo modprobe iwlwifi

# NVIDIA Configuration - use single tee (overwrites)
cat <<EOF | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF

echo 'force_drivers+=" nvidia nvidia_modeset nvidia_uvm nvidia_drm "' | sudo tee /etc/dracut.conf.d/nvidia.conf

# Kernel params - check if already added
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

# CPU Performance
sudo systemctl enable --now tuned
sudo tuned-adm profile throughput-performance
sudo sensors-detect --auto
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference

# NVIDIA Performance
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

# Memory optimization - check if already added
if ! grep -q "vm.swappiness" /etc/sysctl.conf; then
  cat <<EOF | sudo tee -a /etc/sysctl.conf
vm.swappiness=10
vm.vfs_cache_pressure=50
EOF
  sudo sysctl -p
fi

# Rust - skip if already installed
if ! command -v rustc &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  . "$HOME/.cargo/env"
fi

# 1Password - skip if already installed
if ! command -v 1password &>/dev/null; then
  wget https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm -O $HOME/Downloads/1password.rpm
  sudo dnf install -y $HOME/Downloads/1password.rpm
  rm $HOME/Downloads/1password.rpm
fi

# Brave - skip if already installed
if ! command -v brave-browser &>/dev/null; then
  curl -fsSL https://dl.brave.com/install.sh | sh
fi

# Claude - skip if already installed  
if ! command -v claude &>/dev/null; then
  curl -fsSL https://claude.ai/install.sh | bash
fi
