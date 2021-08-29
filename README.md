Dotfiles using gnu stow
=======================

Only prerequisite is the installation of gnu stow.

To install, clone the repo to `~/dotfiles`

```bash
git clone git@github.com:<your-user>/dotfiles.git
```

after which you can enable specific configurations with stow commands:

```bash
cd ~/dotfiles
stow bash
```

Alternatively running the `setup.sh` script will attempt to install all found
configurations.

```bash
~/dotfiles/setup.sh
```

Either approach sets up links between configs in the various dotfiles folders
and the location that they should be in your home folder. After this, any
changes you make will also be reflected in the repo in the `dotfiles` directory
and so if there are updates that should be kept in the repo, these can be
added, committed and pushed if desired. Obviously BE VERY CAREFUL NOT TO
INCLUDE ANYTHING IN THESE FILES THAT YOU WANT TO KEEP SECRET IF YOU ARE PUSHING
TO A PUBLIC GIT. I take no responsibility for any mistakes that others make in
this regard.

The dotfiles repository only intends to look after configuration and so the
responsibility to install programs related to the configuration files is down
to the user. The list below is an incomplete list of the programs that are
included:

 * bash
 * neovim
 * powerline
 * python
 * qtile
 * spacemacs
 * tmux
 * vim

Vim and Neovim currently have separate configurations which both rely on
plugins. Rather than make use of git submodules, there are some basic plugin
update scripts that will:
 1. install the plugin manager if not already installed
 2. run the update

At the moment these scripts are not smart enough to exit after starting up the
editor to run the command. They are idempotent but basically only intended as
a basic convenience at initial configuration time.
