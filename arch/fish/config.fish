source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
end

fish_add_path ~/.local/bin ~/.cargo/bin /opt/nvim/bin

alias cat="bat"
alias cd="z"

zoxide init fish | source
starship init fish | source
