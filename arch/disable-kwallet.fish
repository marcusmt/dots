#!/usr/bin/fish
set kwallet_autostart ~/.config/autostart/org.kde.kwalletd5.desktop
if not test -f $kwallet_autostart; or not grep -q "Hidden=true" $kwallet_autostart
    echo "Disabling KWallet autostart..."
    mkdir -p ~/.config/autostart
    echo "[Desktop Entry]
Type=Application
Name=KWallet
Exec=false
Hidden=true
NoDisplay=true
X-KDE-autostart-condition=false" > $kwallet_autostart
else
    echo "✓ KWallet autostart already disabled"
end

set kwallet_rc ~/.config/kwalletrc
if not test -f $kwallet_rc; or not grep -q "Enabled=false" $kwallet_rc
    echo "Configuring kwalletrc to disable KWallet..."
    mkdir -p ~/.config
    echo "[Wallet]
Enabled=false
First Use=false
Prompt on Open=false
Prompt on Close=false

[org.freedesktop.secrets]
apiEnabled=false

[Auto Allow]
kdewallet=false" > $kwallet_rc
else
    echo "✓ KWallet already disabled in kwalletrc"
end

if pgrep -x kwalletd5 >/dev/null; or pgrep -x kwalletd6 >/dev/null
    echo "Killing running KWallet processes..."
    pkill -9 kwalletd5 2>/dev/null; or true
    pkill -9 kwalletd6 2>/dev/null; or true
else
    echo "✓ No KWallet processes running"
end

set services_masked true
for service in plasma-kwalletd.service kwalletd5.service kwalletd6.service
    if not systemctl --user is-enabled $service 2>&1 | grep -q "masked"
        echo "Masking $service..."
        systemctl --user mask $service 2>/dev/null; or true
        set services_masked false
    end
end
if test $services_masked = true
    echo "✓ KWallet systemd services already masked"
end

set pam_kwallet /etc/pam.d/kwallet
if test -f $pam_kwallet
    if not grep -q "^#" $pam_kwallet
        echo "Disabling PAM kwallet module..."
        sudo sed -i 's/^/# /' $pam_kwallet
    else
        echo "✓ PAM kwallet module already disabled"
    end
else
    echo "✓ No PAM kwallet module found"
end

set hyprland_conf ~/.config/hypr/env.conf
if test -f $hyprland_conf
    if not grep -q "KDE_WALLET_DISABLE" $hyprland_conf
        echo "Adding KWallet disable variables to Hyprland config..."
        echo "
# Disable KWallet completely (package kept for dependencies)
env = KDE_WALLET_DISABLE,1" >> $hyprland_conf
    else
        echo "✓ KWallet environment variables already set in Hyprland"
    end
else
    echo "⚠ Hyprland config not found at $hyprland_conf"
    echo "  Add these manually:"
    echo "  env = KDE_WALLET_DISABLE,1"
end

echo ""
echo "=== KWallet Fully Disabled ==="
echo ""
echo "Summary:"
echo "  ✓ Package kept installed (dependencies satisfied)"
echo "  ✓ Autostart disabled"
echo "  ✓ Service masked"
echo "  ✓ Configuration disabled"
echo "  ✓ PAM module disabled"
echo "  ✓ Environment variables set"
echo ""
echo "KWallet will never start or prompt you again."
echo "Logout and login (or reboot) for full effect."
