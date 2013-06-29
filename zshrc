# Based on https://github.com/dfm/dotfiles
fpath=("$HOME/dotfiles/zsh/functions" $fpath)

autoload -U compinit
compinit -i

# Source all the config files.
for config_file ($HOME/dotfiles/**/*.zsh) source $config_file

# Choose a prompt
source $HOME/dotfiles/prompts/jsick_vcs_info.zsh

# Add bin to path
export PATH=$HOME/dotfiles/bin:$PATH

# Setup z: https://github.com/rupa/z
. $HOME/dotfiles/lib/z/z.sh

# Source personal configurations maintained in git
source $HOME/dotfiles/vars

# Cache PIP for speed (great for setting up virtual environments)
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

# Setup virtualenvwrapper
# Running this after all the python paths have been set up
# http://virtualenvwrapper.readthedocs.org/en/latest/index.html
if (( $+commands[virtualenvwrapper.sh] )) ; then
    # virtualenvwrapper exists
    export WORKON_HOME=$HOME/.virtualenvs
    mkdir -p $WORKON_HOME
    source virtualenvwrapper.sh
    # Sync up virtualenv with virtualenvwrapper
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    # pip always installs in the active virtualenv
    export PIP_RESPECT_VIRTUALENV=true
fi

# Finally, local settings not in git
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi
