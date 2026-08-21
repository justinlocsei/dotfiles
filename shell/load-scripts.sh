#!/bin/bash

# Source shared scripts and scripts for the active shell
case "${BASH_VERSION+x}:${ZSH_VERSION+x}" in
  x:*)
    loader_path="${BASH_SOURCE[0]}"
    shell_name=bash
    ;;
  :x*)
    loader_path="${(%):-%N}"
    shell_name=zsh
    ;;
  *)
    return 0 2>/dev/null || exit 0
    ;;
esac

repository_path="$(cd "$(dirname "$loader_path")/../.." && pwd)" || return 1

source_scripts() {
  local scripts_path=$1
  local loader_script=$2
  local script

  for script in "$scripts_path"/*.sh; do
    [ -f "$script" ] || continue
    [ "$script" = "$loader_script" ] && continue
    . "$script"
  done
}

source_scripts "$repository_path/shell/scripts" "$repository_path/shell/scripts/source.sh"
source_scripts "$repository_path/$shell_name/scripts" ""

unset -f source_scripts
unset loader_path repository_path shell_name script scripts_path loader_script
