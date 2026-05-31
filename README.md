# dots

Personal dotfiles for Fedora and Arch Linux. Themed around [Kanagawa](https://github.com/rebelot/kanagawa.nvim).

## What's included

### Shell & Editor

| Config | Tool |
|--------|------|
| `fish/` | Fish shell (with eza, bat, zoxide, fzf, starship) |
| `zsh/` | Zsh shell (with eza, bat, zoxide, fzf, starship, plugins) |
| `nvim/` | Neovim theme (LazyVim + Kanagawa) |

### Terminal Emulators

| Config | Tool |
|--------|------|
| `ghostty/` | Ghostty (Wayland) |

### Desktop (i3 / X11)

| Config | Tool |
|--------|------|
| `linux/i3-setup/i3/` | Window manager, status bar, keybinds, scripts |
| `linux/i3-setup/dunst/` | Notification daemon |
| `linux/i3-setup/picom/` | Compositor |
| `linux/i3-setup/rofi/` | App launcher |

### Desktop (Niri / Wayland)

| Config | Tool |
|--------|------|
| `linux/niri/` | Niri Wayland compositor |

### Other

| Config | Tool |
|--------|------|

### i3 scripts

- `brightness_control.sh` — brightness up/down via media keys
- `volume_notify.sh` / `mic_notify.sh` — OSD notifications on audio changes
- `monitor-watch.sh` — auto-detect monitor plug/unplug and reconfigure displays
- `i3status_wrapper.py` — custom i3bar status line with PipeWire volume

## Install

### Fedora

```sh
git clone https://github.com/marcusmt/dots.git ~/dots
cd ~/dots/linux
./install-fedora-i3.sh    # i3 + X11 setup
# or
./install-fedora-gnome.sh # GNOME setup
```

For NVIDIA drivers:
```sh
./fedora/nvidia.sh
# or from linux/
../fedora/nvidia.sh
```

### Arch Linux

```sh
cd ~/dots/arch
./paru.sh          # install paru AUR helper first
./arch.sh          # install packages, Brave, Neovim, Claude
./1password.sh     # install 1Password from AUR
```

### Extra tools (Fedora)

```sh
cd ~/dots/linux
./update.sh
```

This installs (skipped if already present):
- **Hack Nerd Font** (to `~/.fonts`)
- **Starship** prompt
- **Zoxide** (`z` as a smart `cd`)
- **eza**, **bat**, **ripgrep**, **fd** via Cargo
- Sets up **LazyVim** with Kanagawa theme

### Zsh setup

```sh
cd ~/dots/zsh
./zsh.sh           # install plugins, starship, zoxide, cargo tools
cp .zshrc ~/.zshrc
```
