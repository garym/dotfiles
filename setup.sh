#!/bin/bash
base=$(dirname $0)
cd "$base"
for dir in *; do
  if [ -d "$dir" ]; then
    echo "Activating '$dir'"
    stow "$dir"
  fi
done
