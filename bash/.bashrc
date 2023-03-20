# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

svngrep() { grep  --color=always --exclude-dir=".svn" -r "$1" . | less -R; }

DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
if command -v flatpak-spawn>/dev/null 2>&1 ; then
  alias docker-compose='flatpak-spawn --host --env=DOCKER_HOST=$DOCKER_HOST docker-compose'
  alias docker='flatpak-spawn --host docker'
  alias podman='flatpak-spawn --host podman'
  #alias podman-compose='flatpak-spawn --host --env=DOCKER_HOST=$DOCKER_HOST podman-compose'
fi

if [ -f "/run/.containerenv" ]; then
  alias emacs='emacsclient -c -a "emacs"'
  alias xdg-open='flatpak-xdg-open'
fi

if command -v emacsclient>/dev/null 2>&1 ; then
  alias emacs='emacsclient -c -a "emacs"'
else
  alias emacs='toolbox run --container dev emacsclient -c -a "emacs"'
fi

alias vi='$EDITOR'
