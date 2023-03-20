# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin-overrides:$HOME/.config/emacs/bin:$PATH:$HOME/.local/bin:$HOME/bin

export PATH

if command -v powerline-daemon >/dev/null 2>&1 ; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
elif command -v starship >/dev/null 2>&1 ; then
  eval "$(starship init bash)"
fi

if command -v nvim >/dev/null 2>&1 ; then
  EDITOR="nvim"
else
  EDITOR="vi"
fi

[ -n "$VISUAL" ] || VISUAL="$EDITOR"
export VISUAL
export EDITOR

[ -f "$HOME/.config/python/pythonstartup.py" ] && export PYTHONSTARTUP="$HOME/.config/python/pythonstartup.py"

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

if [ -x /usr/bin/src-hilite-lesspipe.sh ]; then
  export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
fi

export LESS=' -R -F -X '

# disable software flow control (Ctrl-S Ctrl-Q in terminals)
if [ -t 1 ]; then
  stty -ixon
fi

if [ -f "/run/.containerenv" ]; then
  export TOOLBOX_NAME_ENV="$(awk -F'"' '/name=/ {print $2}' /run/.containerenv)"
  export TOOLBOX_POWERLINE_DISPLAY="⬢ [$TOOLBOX_NAME_ENV]"
fi
