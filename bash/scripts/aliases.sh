# shellcheck shell=bash

# Use an OS-specific rich-list function
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias ll="ls -Glh"
else
  alias ll="ls -lh --color=auto"
fi

# Profile management
alias sbp="source ~/.bash_profile"
alias vbp="vi ~/.bash_profile"

# Git
alias gba="git branch -a"
alias gca="git commit -a"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"
alias gs="git status"
alias grpo="git remote prune origin"

# Quietly run npm scripts
nr() {
  if [ $# -eq 0 ]; then
    npm run
  else
    npm run -s "$@"
  fi
}

# Search for Docker images
dil() {
  docker image ls | grep "$1"
}

# Show all processes that match a name
pag() {
  ps aux | grep -v grep | grep -e "$1"
}

# Run a command a given number of times
run_times() {
  local index

  for ((index=1; index <= $(($1)); index++)); do
    echo "-> Run $index"
    "${@:2}"
    echo
  done
}
