# Based on https://github.com/dfm/dotfiles
fpath=("$HOME/dotfiles/zsh/functions" $fpath)

autoload -U compinit
compinit -i

# Source all the config files.
for config_file ($HOME/dotfiles/**/*.zsh) source $config_file

# Choose a prompt
source $HOME/dotfiles/prompts/dfm.zsh

# Add bin to path
export PATH=$HOME/dotfiles/bin:$PATH

# Setup z: https://github.com/rupa/z
. $HOME/dotfiles/z/z.sh

# Source personal configurations maintained in git
source $HOME/dotfiles/vars

# Finally, local settings not in git
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi
