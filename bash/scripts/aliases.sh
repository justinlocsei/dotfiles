# Use an OS-specific rich-list function
if [[ `uname -s` == "Darwin" ]]; then
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

# Kubernetes
alias kcd="kubectl describe"
alias kcg="kubectl get"
alias kcl="kubectl logs"

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
