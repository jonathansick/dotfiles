# Based on https://github.com/dfm/dotfiles
fpath=("$HOME/dotfiles/zsh/functions" $fpath)

autoload -U compinit
compinit -i

# Source all the config files.
for config_file ($HOME/dotfiles/**/*.zsh) source $config_file

# Add bin to path
export PATH=$HOME/dotfiles/bin:$PATH

# Finally, local settings
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi
