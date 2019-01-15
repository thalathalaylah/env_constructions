#!/bin/sh

if [ ! -e ~/.config/fish/functions/fisher.fish ]; then
  cat ~/.config/fish/fishfile
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
  cat ~/.config/fish/fishfile
fi
fish -c "fisher"
cat ~/.config/fish/fishfile