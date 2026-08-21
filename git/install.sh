# shellcheck shell=bash

ensure_symlink_exists "git configuration file" "$(child_path git/config/gitconfig)" "$HOME/.gitconfig"
