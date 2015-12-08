# Use an OS-specific rich-list function
if [[ `uname -s` == "Darwin" ]]; then
  alias ll='ls -Glh'
else
  alias ll='ls -lh --color=auto'
fi

# Profile management
alias sbp='source ~/.bash_profile'

# Ruby
alias bcon='bundle exec rails console'
alias bcuke='bundle exec cucumber'
alias brake='bundle exec rake'
alias brails='bundle exec rails'
alias bspec='bundle exec rspec'
alias be='bundle exec'
alias zcon='zeus console'
alias zcuke='zeus cucumber'
alias zrake='zeus rake'
alias zs='zeus server'
alias zu='zeus start'
alias zspec='zeus rspec'

# Git
alias gba='git branch -a'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gs='git status'

# Show all processes that match a name
pag() {
  ps aux | grep -v grep | grep -e "$1"
}
