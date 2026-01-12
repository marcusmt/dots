#!/usr/bin/env bash
set -e

# Add repos
sudo tee /etc/yum.repos.d/terra.repo > /dev/null << 'EOF'
[terra]
name=Terra
baseurl=https://repos.fyralabs.com/terra$releasever
enabled=1
gpgcheck=1
gpgkey=https://repos.fyralabs.com/terra$releasever/key.asc
EOF

sudo curl -fsSLo /etc/yum.repos.d/brave-browser.repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# Install everything in one transaction
curl -fsSLo /tmp/1password.rpm https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm
rpm-ostree install niri noctalia-shell fish brave-browser mate-polkit /tmp/1password.rpm

