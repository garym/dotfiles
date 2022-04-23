# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

if command -v starship >/dev/null 2>&1 ; then
  eval "$(starship init bash)"
elif command -v powerline-daemon >/dev/null 2>&1 ; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
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

svngrep() { grep  --color=always --exclude-dir=".svn" -r "$1" . | less -R; }

# disable software flow control (Ctrl-S Ctrl-Q in terminals)
if [ -t 1 ]; then
  stty -ixon
fi

DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
if command -v flatpak-spawn>/dev/null 2>&1 ; then
  alias docker-compose='flatpak-spawn --host --env=DOCKER_HOST=$DOCKER_HOST docker-compose'
  alias docker='flatpak-spawn --host docker'
  alias podman='flatpak-spawn --host podman'
fi

if [ -f "/run/.containerenv" ]; then
  export TOOLBOX_NAME_ENV="$(awk -F'"' '/name=/ {print $2}' /run/.containerenv)"
  export TOOLBOX_POWERLINE_DISPLAY="⬢ [$TOOLBOX_NAME_ENV]"
  alias emacs='emacsclient -c -a "emacs"'
  alias xdg-open='flatpak-xdg-open'
else
  alias emacs='toolbox run --container dev emacsclient -c -a "emacs"'
fi
