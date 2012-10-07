# Based on https://github.com/dfm/dotfiles
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

alias ..="cd .."
alias ...="cd ../.."

# `mkdir` then `cd`.
function mcd() {
    mkdir -p "$1" && cd "$1";
}
