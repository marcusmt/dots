if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH /path/to/your/program/directory $PATH

starship init fish | source
