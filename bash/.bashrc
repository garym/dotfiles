# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

if command -v powerline-daemon >/dev/null 2>&1 ; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

if command -v nvim >/dev/null 2>&1 ; then
  EDITOR="nvim"
fi

[ -f "$HOME/.pythonrc" ] && export PYTHONSTARTUP="$HOME/.pythonrc"

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

if [ -x /usr/bin/src-hilite-lesspipe.sh ]; then
  export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
fi

export LESS=' -R -F -X '

svngrep() { grep  --color=always --exclude-dir=".svn" -r "$1" . | less -R; }

export PS1="\e[m$PS1\e[0:32m"
set -o vi

# disable software flow control (Ctrl-S Ctrl-Q in terminals)
if [ -t 1 ]; then
  stty -ixon
fi
