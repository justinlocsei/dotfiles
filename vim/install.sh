# shellcheck shell=bash

ensure_symlink_exists "vim config" "$(child_path vim/config/vimrc)" "$HOME/.vimrc"
