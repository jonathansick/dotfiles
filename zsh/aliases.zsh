# Based on https://github.com/dfm/dotfiles
alias lsa="ls -lah"
alias l="ls -la"
alias ll="ls -l"
alias sl=ls

alias c="clear"
alias v="vim"

alias mkhtml="ls *.png | awk '{print \"<img src=\\\"\" $1 \"\\\" />\"}' > index.html"

# For github pages import script
# https://github.com/davisp/ghp-import
alias push-docs="ghp-import -p -n docs/_build/html"
