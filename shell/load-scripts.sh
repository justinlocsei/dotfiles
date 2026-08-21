# shellcheck shell=bash disable=SC1090,SC2296

# Source shared and shell-specific scripts
#
# @param $1 The path to the loader script
# @param $2 The name of the current shell
load_shell_scripts() {
  local root_dir script script_dir

  root_dir="$(cd "$(dirname "$1")/.." && pwd)" || return 1

  for script_dir in shell "$2"; do
    for script in "$root_dir/$script_dir/scripts"/*.sh; do
      if [ -f "$script" ]; then
        . "$script"
      fi
    done
  done
}

if [ -n "$BASH_VERSION" ]; then
  load_shell_scripts "${BASH_SOURCE[0]}" bash
elif [ -n "$ZSH_VERSION" ]; then
  load_shell_scripts "${(%):-%N}" zsh
fi

unset -f load_shell_scripts
