Dotfiles using gnu stow
=======================

The main prerequisite is the installation of gnu stow which looks after the
creation of symlinks from the checked out repo to their required locations.

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
added, committed and pushed if desired.

Hopefully it goes without saying but anyone intending to fork this repo and
modifying it for their own purposes should be careful to AVOID COMMITTING
SECRETS that they would prefer remain secret.

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

The Neovim configuration may also require the following packages:

 * gcc-c++
 * python3-language-server - I have used the package from the fedora repos
    rather than using https://github.com/python-lsp/python-lsp-server/ which
    seems to require specifying the command to use.
 * python3-flake8
 * file
 * htop/top
