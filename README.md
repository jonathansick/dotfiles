**This dotfile project is retired. See [jonathansick/sickconfig](https://github.com/jonathansick/sickconfig) for new [rcm](http://thoughtbot.github.io/rcm/)-based dotfiles.**

****

# Jonathan Sick's dotfiles

These dotfiles are shamelessly based on [Dan-FM's][] and [oh-my-zsh][].
This isn't a fork of those since I wanted to patiently sort through each file, select what I want, and carry-over design choices from my previous generation of dotfies.

## Installation

With `curl` available:

    curl -L https://raw.github.com/jonathansick/dotfiles/master/tools/bootstrap.sh | bash

This will run clone these dotfiles into `$HOME/dotfiles/`, install [sickvim][] in `$HOME/.vim/` and link appropriate dotfiles into `$HOME` itself.
*Note:* the branch name in URL of the bootstrap script can be changed to support the system you're bootstrapping into.

By default bootstrap scripts set the remote URL of both this dotfiles repository and [sickvim][] to use HTTPS so that they can be bootstrapped into virtual machines that don't have my Git credentials.
*If you're me*, however, you can run

    $HOME/dotfiles/tools/enable_github.sh; $HOME/.vim/enable_github.sh

to change the git origin remote URLs to use SSH instead.

### Uninstallation

Run

    tools/uninstall.sh

to remove all links created by the bootstrap script.
The `$HOME/dotfiles/` directory won't be deleted.

## Architecture

My hope with these dotfiles is to maintain a generic cross-platform dotfile in the `master` branch, while maintaining branches specifically for Mac OS X, ubuntu, EC2 machine images, *etc.*.

Available localizations are:

- [`mac`](https://github.com/jonathansick/dotfiles/tree/mac)

## Documentation

I started [a wiki](https://github.com/jonathansick/dotfiles/wiki) to maintain notes, both about these dotfiles, and for platform-specific software build tricks.

[Dan-FM's]: https://github.com/dfm/dotfiles
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[sickvim]: https://github.com/jonathansick/sickvim
