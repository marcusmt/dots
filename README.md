# dots

Personal dotfiles for Fedora and Arch Linux. Themed around [Kanagawa](https://github.com/rebelot/kanagawa.nvim).

## What's included

| Config | Tool |
|--------|------|
| `fish/` | Fish shell (with eza, bat, zoxide, fzf, starship) |
| `nvim/` | Neovim theme (LazyVim + Kanagawa) |

## Install

### Fedora

```sh
git clone https://github.com/marcusmt/dots.git ~/dots
cd ~/dots/linux
./install-fedora-gnome.sh
```

For NVIDIA drivers:
```sh
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
