#!/bin/sh

if [ ! -e ~/.config/fish/functions/fisher.fish ]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
fi
echo fisher | fish
