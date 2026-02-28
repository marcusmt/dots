# dots

Personal dotfiles for a Fedora + i3 desktop setup. Themed around [Kanagawa](https://github.com/rebelot/kanagawa.nvim).

## What's included

| Config | Tool |
|--------|------|
| `alacritty/` | Terminal emulator |
| `dunst/` | Notification daemon |
| `fish/` | Shell (with eza, bat, zoxide, fzf, starship) |
| `i3/` | Window manager, status bar, keybinds, scripts |
| `picom/` | Compositor (transparency/shadows) |
| `rofi/` | App launcher |

### i3 scripts

- `brightness_control.sh` — brightness up/down via media keys
- `volume_notify.sh` / `mic_notify.sh` — OSD notifications on audio changes
- `monitor-hotplug.sh` / `monitor-watch.sh` — auto-detect monitor plug/unplug
- `i3status_wrapper.py` — custom i3bar status line

## Install

### 1. Clone and run the installer

```sh
git clone https://github.com/marcusmt/dots.git ~/dots
cd ~/dots
./install-_SELECT_.sh
```

This will:
- Update the system and install all required packages via `dnf`
- Install Rust (if not present)
- Install 1Password, Brave, and Claude CLI (skipped if already installed)
- Copy all configs to `~/.config/`

### 2. Install extra tools

```sh
./update.sh
```

This installs:
- **Hack Nerd Font** (to `~/.fonts`)
- **Starship** prompt
- **Zoxide** (`z` as a smart `cd`)
- **eza**, **bat**, **ripgrep** via Cargo
- **fzf**
- Sets the GTK theme to `adw-gtk3-dark`

