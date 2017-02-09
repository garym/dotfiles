Dotfiles using gnu stow
=======================

Only prerequisite is the installation of gnu stow.

Once the repo is cloned to ~/dotfiles you can enable configurations with stow
commands:

  cd ~/dotfiles
  stow bash

Which allows you to add configuration per application. Alternatively run the
setup.sh script which will attempt to install all found configurations.

  ~/dotfiles/setup.sh

The dotfiles repository only intends to look after configuration and so the
responsibility to install programs related to the configuration files is down
to the user. The list below is an incomplete list of the programs that are
included:

 * bash
 * powerline
 * python
 * spacemacs
 * tmux (including tmuxinator)
 * vim
