# dots

Personal dotfiles for a Fedora desktop setup. Themed around [Kanagawa](https://github.com/rebelot/kanagawa.nvim).

## What's included

| Config | Tool |
|--------|------|
| `alacritty/` | Terminal emulator |
| `ghostty/` | Terminal emulator (Wayland) |
| `fish/` | Shell (with eza, bat, zoxide, fzf, starship) |
| `nvim/` | Neovim theme (LazyVim + Kanagawa) |
| `linux/i3-setup/dunst/` | Notification daemon |
| `linux/i3-setup/i3/` | Window manager, status bar, keybinds, scripts |
| `linux/i3-setup/picom/` | Compositor (transparency/shadows) |
| `linux/i3-setup/rofi/` | App launcher |
| `linux/niri/` | Wayland compositor (niri) |
| `linux/yazi/` | File manager |

### i3 scripts

- `brightness_control.sh` — brightness up/down via media keys
- `volume_notify.sh` / `mic_notify.sh` — OSD notifications on audio changes
- `monitor-watch.sh` — auto-detect monitor plug/unplug and reconfigure displays
- `i3status_wrapper.py` — custom i3bar status line with PipeWire volume

## Install

### 1. Clone and run the installer

```sh
git clone https://github.com/marcusmt/dots.git ~/dots
cd ~/dots/linux
./install-fedora-i3.sh    # i3 + X11 setup
# or
./install-fedora-gnome.sh # GNOME setup
```

This will:
- Update the system and install all required packages via `dnf`
- Install Rust (if not present)
- Install 1Password and Claude CLI (skipped if already installed)
- Copy all configs to `~/.config/`

### 2. Install extra tools

```sh
./update.sh
```

This installs (skipped if already present):
- **Hack Nerd Font** (to `~/.fonts`)
- **Starship** prompt
- **Zoxide** (`z` as a smart `cd`)
- **eza**, **bat**, **ripgrep**, **yazi** via Cargo
- Sets up **LazyVim** with Kanagawa theme
