#!/usr/bin/fish
# nvidia-performance-tuning.fish - Idempotent NVIDIA performance optimization

echo "=== NVIDIA Performance Optimization ==="
echo ""

# 1. Set maximum performance mode
echo "Setting maximum performance mode..."
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"

# 2. Create performance configuration if needed
set conf_file /etc/modprobe.d/nvidia-performance.conf
set conf_content "options nvidia NVreg_PreserveVideoMemoryAllocations=1
options nvidia NVreg_TemporaryFilePath=/var/tmp
options nvidia NVreg_UsePageAttributeTable=1"

if not test -f $conf_file; or not string match -q "$conf_content" (cat $conf_file 2>/dev/null)
    echo "Creating/updating NVIDIA performance configuration..."
    echo "$conf_content" | sudo tee $conf_file > /dev/null
else
    echo "✓ NVIDIA performance configuration already exists"
end

# 3. Enable persistence mode
echo "Checking persistence mode..."
set pm_status (sudo nvidia-smi -q | grep "Persistence Mode" | awk '{print $4}')
if test "$pm_status" != "Enabled"
    echo "Enabling persistence mode..."
    sudo nvidia-smi -pm 1
else
    echo "✓ Persistence mode already enabled"
end

# 4. Setup systemd service
set service_file /etc/systemd/system/nvidia-persistenced.service
if not test -f $service_file
    echo "Creating systemd service..."
    echo "[Unit]
Description=NVIDIA Persistence Daemon
Wants=syslog.target

[Service]
Type=forking
ExecStart=/usr/bin/nvidia-persistenced --user nvidia-persistenced --verbose
ExecStopPost=/bin/rm -rf /var/run/nvidia-persistenced

[Install]
WantedBy=multi-user.target" | sudo tee $service_file > /dev/null
    
    sudo systemctl daemon-reload
    sudo systemctl enable nvidia-persistenced.service
    sudo systemctl start nvidia-persistenced.service
else
    echo "✓ Systemd service already exists"
    if not systemctl is-enabled nvidia-persistenced.service &>/dev/null
        sudo systemctl enable nvidia-persistenced.service
    end
    if not systemctl is-active nvidia-persistenced.service &>/dev/null
        sudo systemctl start nvidia-persistenced.service
    end
end

echo ""
echo "=== Optimization Complete ==="
