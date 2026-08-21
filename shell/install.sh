# shellcheck shell=bash

(
  shopt -s dotglob nullglob

  for file in "$(child_path shell/config)"/*; do
    name="$(basename "$file")"
    ensure_symlink_exists "$name" "$file" "$HOME/$name"
  done
)
