# shellcheck shell=bash

install_files() {
  for file in "$(child_path shell/config)"/*; do
    local name
    name="$(basename "$file")"

    ensure_symlink_exists "$name" "$file" "$HOME/$name"
  done
}

install_files

unset -f install_files
