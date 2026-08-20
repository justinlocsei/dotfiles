# Use vim as the default editor
export EDITOR=vim

# Use vi-style navigation
bindkey -v

# Create a directory for user executables
mkdir -p "$HOME/bin"
export PATH="$HOME/bin:$PATH"
