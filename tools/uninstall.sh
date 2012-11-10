#!/bin/zsh

# Unlink the dotfiles in the root user directory that were installed by the
# the bootstrap.
rm -f $HOME/.zshrc
rm -f $HOME/.gitconfig
rm -f $HOME/.gitexcludes
rm -f $HOME/.tmux.conf
rm -f $HOME/.matplotlib/matplotlibrc
