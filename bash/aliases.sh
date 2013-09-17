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

# Git
alias gc='git commia'
alias gca='git commit -a'
alias gco='git checkout'
alias gm='git merge'
alias gpl='git pull'
alias gpu='git push'
alias gs='git status'

# Browserstack
alias browserstack='java -jar /usr/local/lib/BrowserStackTunnel.jar tqG7h8wWcbJccGVq5Yz8 localhost,3000,0'
