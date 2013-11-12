#!/bin/sh

if [ -f "$HOME/.gitconfig" ]; then
  echo "Git config file already exists"
else
  echo "Creating symlink to git config"
  ln -s "$PWD/gitconfig" "$HOME/.gitconfig"
fi

