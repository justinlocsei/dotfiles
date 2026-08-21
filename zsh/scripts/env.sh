# shellcheck shell=sh

# Use vi navigation
bindkey -v
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

# Globbing and directory navigation
setopt auto_pushd
setopt extended_glob
setopt pushd_ignore_dups

# History
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history

# Interactive shell
setopt interactive_comments
setopt no_beep

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
