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

# Show all processes that match a name
pag() {
  ps aux | grep -v grep | grep -e "$1"
}
