#!/bin/bash

# Dotfiles installation script
# Based on https://github.com/dfm/dotfiles
#
# Get the machinery rolling with:
# curl -L https://raw.github.com/jonathansick/dotfiles/master/tools/bootstrap.sh | bash


DOTDIR=$HOME/dotfiles

if [ -d $DOTDIR ]; then
    echo "jonathansick/dotfiles seems to be installed already."
    exit 1;
fi

# Get it
git clone https://github.com/jonathansick/dotfiles.git $DOTDIR
cd $DOTDIR
git submodule update --init

# Link dotfiles that need to be in $HOME
ln -Ffs $DOTDIR/zshrc $HOME/.zshrc
ln -Ffs $DOTDIR/gitconfig $HOME/.gitconfig
ln -Ffs $DOTDIR/gitexcludes $HOME/.gitexcludes
ln -Ffs $DOTDIR/tmux.conf $HOME/.tmux.conf
ln -Ffs $DOTDIR/adsbibdesk $HOME/.adsbibdesk

# Matplotlib
mkdir -p $HOME/.matplotlib
ln -Ffs $DOTDIR/matplotlibrc $HOME/.matplotlib/matplotlibrc

# Virtualenvwrapper
mkdir -p $HOME/.virtualenvs
ln -Ffs $DOTDIR/virtualenvwrapper/get_env_details $HOME/.virtualenvs/get_env_details
ln -Ffs $DOTDIR/virtualenvwrapper/initialize $HOME/.virtualenvs/initialize
ln -Ffs $DOTDIR/virtualenvwrapper/postactivate $HOME/.virtualenvs/postactivate
ln -Ffs $DOTDIR/virtualenvwrapper/postdeactivate $HOME/.virtualenvs/postdeactivate
ln -Ffs $DOTDIR/virtualenvwrapper/postmkproject $HOME/.virtualenvs/postmkproject
ln -Ffs $DOTDIR/virtualenvwrapper/postrmproject $HOME/.virtualenvs/postrmproject
ln -Ffs $DOTDIR/virtualenvwrapper/postmkvirtualenv $HOME/.virtualenvs/postmkvirtualenv
ln -Ffs $DOTDIR/virtualenvwrapper/postrmvirtualenv $HOME/.virtualenvs/postrmvirtualenv
ln -Ffs $DOTDIR/virtualenvwrapper/preactivate $HOME/.virtualenvs/preactivate
ln -Ffs $DOTDIR/virtualenvwrapper/predeactivate $HOME/.virtualenvs/predeactivate
ln -Ffs $DOTDIR/virtualenvwrapper/premkproject $HOME/.virtualenvs/premkproject
ln -Ffs $DOTDIR/virtualenvwrapper/premkvirtualenv $HOME/.virtualenvs/premkvirtualenv
ln -Ffs $DOTDIR/virtualenvwrapper/prermproject $HOME/.virtualenvs/prermproject
ln -Ffs $DOTDIR/virtualenvwrapper/prermvirtualenv $HOME/.virtualenvs/prermvirtualenv


# Vim is configured in a separate repo
# But we can setup it up now
DOTVIM=$HOME/.vim
if [ ! -d $DOTVIM ]; then
    curl -L https://raw.github.com/jonathansick/sickvim/master/bootstrap.sh | bash
    else
        echo "sickvim is already installed."
fi


# Pygments
pip install pygments >/dev/null >&2 || { echo "You should really install pip/pygments..."; }
