typeset -U path
path=(~/.local/bin/ ~/.cargo/bin/ $path)

path_add() {
  [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

HISTSIZE=10000
SAVEHIST=10000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt AUTO_MENU
setopt COMPLETE_IN_WORD

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit
compinit

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles

# Common use
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cat="bat -p -P"
alias cd="z"

# Plugins — cross-platform
source "$HOME/.zsh/you-should-use/you-should-use.plugin.zsh"
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
