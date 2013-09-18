# Common 
if [[ `uname -s` == "Darwin" ]]; then
  alias ll='ls -Glh'
else
  alias ll='ls -lh --color=auto'
fi

# Ruby
alias brake='bundle exec rake'
alias brails='bundle exec rails'
alias bspec='bundle exec rspec'
alias be='bundle exec'
alias zr='zeus rake'
alias zs='zeus server'
alias zu='zeus start'
alias zspec='zeus rspec'

# Git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gm='git merge'
alias gpl='git pull'
alias gpu='git push'
alias gs='git status'

