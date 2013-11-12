#!/bin/sh

if [ -f "$HOME/.vimrc" ]; then
  echo "Vim configuration file already exists"
else
  echo "Creating symlink to vim configuration file"
  ln -s "$PWD/vimrc" "$HOME/.vimrc"
fi
