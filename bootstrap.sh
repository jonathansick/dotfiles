#!/bin/bash

# Dotfiles installation script
# Based on https://github.com/dfm/dotfiles
#
# Get the machinery rolling with:
# curl -L https://raw.github.com/jonathansick/dotfiles/master/bootstrap.sh | bash


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

# Matplotlib
mkdir -p $HOME/.matplotlib
ln -Ffs $DOTDIR/matplotlibrc $HOME/.matplotlib/matplotlibrc


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
