# shellcheck shell=sh

# Use vim as the default editor
export EDITOR=vim

# Create a directory for user executables
mkdir -p "$HOME/bin"
export PATH="$HOME/bin:$PATH"
