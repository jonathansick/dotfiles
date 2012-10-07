# Dotfiles installation script
# Based on https://github.com/dfm/dotfiles

# Get the dotfiles directory (based on where this script is running from)
DOTDIR=$HOME/dotfiles
if [ `pwd` != $DOTDIR ]; then
    echo "This must be run from $HOME/dotfiles"
    git submodule update --init
    exit 1;
fi

# Vim is configured in a separate repo
# But we can setup it up now
DOTVIM=$HOME/.vim
if [ ! -d $DOTVIM ]; then
    git clone git@github.com:jonathansick/sickvim.git $DOTVIM
    (cd $DOTVIM; git submodule update --init)
    ln -Ffs $DOTVIM/vimrc $HOME/.vimrc
    else
        echo "sickvim is already installed."
fi

# Link dotfiles that need to be in $HOME
ln -Ffs $DOTDIR/zshrc $HOME/.zshrc
ln -Ffs $DOTDIR/gitconfig $HOME/.gitconfig
ln -Ffs $DOTDIR/gitexcludes $HOME/.gitexcludes
ln -Ffs $DOTDIR/gitexcludes $HOME/.gitexcludes
ln -Ffs $DOTDIR/tmux.conf $HOME/.tmux.conf
ln -Ffs $DOTDIR/adsbibdesk $HOME/.adsbibdesk

# Matplotlib
mkdir -p $HOME/.matplotlib
ln -Ffs $DOTDIR/matplotlibrc $HOME/.matplotib/matplotlibrc

# Pygments
pip install pygments >/dev/null >&2 || { echo "You should really install pip/pygments..."; }
