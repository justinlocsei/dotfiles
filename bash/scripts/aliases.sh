# Use an OS-specific rich-list function
if [[ `uname -s` == "Darwin" ]]; then
  alias ll="ls -Glh"
else
  alias ll="ls -lh --color=auto"
fi

# Profile management
alias sbp="source ~/.bash_profile"
alias vbp="vi ~/.bash_profile"

# Ruby
alias bcon="bundle exec rails console"
alias bcuke="bundle exec cucumber"
alias be="bundle exec"
alias brails="bundle exec rails"
alias brake="bundle exec rake"
alias bspec="bundle exec rspec"
alias zcon="zeus console"
alias zcuke="zeus cucumber"
alias zrake="zeus rake"
alias zs="zeus server"
alias zspec="zeus rspec"
alias zu="zeus start"

# Git
alias gba="git branch -a"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"
alias gs="git status"

# Node.js
alias npe="PATH=$(npm bin):$PATH"

# Show all processes that match a name
pag() {
  ps aux | grep -v grep | grep -e "$1"
}
