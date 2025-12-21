#!/bin/zsh

# ============================================================================
# Environment Variables
# ============================================================================

# Format man pages with bat
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ============================================================================
# Path Configuration
# ============================================================================

# Append directories to PATH (zsh equivalent of fish_add_path)
path=(
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "/opt/nvim/bin"
    $path
)
export PATH

# ============================================================================
# Plugin Manager - Zinit
# ============================================================================

# Install zinit if not present
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ Installing Flexible and fast ZSH plugin manager %F{220}(zinit)%f"
    command mkdir -p "$(dirname $ZINIT_HOME)"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        print -P "%F{33}▓▒░ Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.zsh"

# ============================================================================
# Plugins
# ============================================================================

# Fish-like autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Fix phantom key issues
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Disable autosuggestions in paste mode
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)

# Fish-like syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Additional completions
zinit light zsh-users/zsh-completions

# Better history substring search
zinit light zsh-users/zsh-history-substring-search

# FZF tab completion (better than default)
zinit light Aloxaf/fzf-tab

# ============================================================================
# Shell Options
# ============================================================================

setopt AUTO_CD              # Type directory name to cd
setopt AUTO_PUSHD           # Make cd push old directory onto directory stack
setopt PUSHD_IGNORE_DUPS    # Don't push multiple copies
setopt PUSHD_SILENT         # Don't print directory stack
setopt HIST_IGNORE_ALL_DUPS # Don't record duplicates in history
setopt HIST_FIND_NO_DUPS    # Don't show duplicates in search
setopt SHARE_HISTORY        # Share history between sessions
setopt EXTENDED_HISTORY     # Write timestamp to history
setopt INC_APPEND_HISTORY   # Add commands immediately

# ============================================================================
# Completion System
# ============================================================================

autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colorize completions using LS_COLORS
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better completion menu
zstyle ':completion:*' menu select

# FZF tab styling
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --height=80%

# ============================================================================
# History Configuration
# ============================================================================

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ============================================================================
# Keybindings
# ============================================================================

# Vi mode (optional - remove if you prefer emacs mode)
# bindkey -v

# Use emacs keybindings (Fish default)
#bindkey -e

# History substring search keybindings
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

# ============================================================================
# Aliases
# ============================================================================

# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'
alias l.='eza -a | grep -e "^\."'

# Common use
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cat='bat'
alias cd='z'

# ============================================================================
# Initialize Tools
# ============================================================================

# Zoxide (better cd)
eval "$(zoxide init zsh)"

# Starship prompt
eval "$(starship init zsh)"

# ============================================================================
# Custom Functions (Fish-like convenience)
# ============================================================================

# Create directory and cd into it (Fish-like convenience)
mkcd() {
    mkdir -p "$1" && cd "$1"
}

