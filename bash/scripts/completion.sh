# shellcheck shell=bash

git_completion=/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

if [ -r "$git_completion" ]; then
  # shellcheck source=/dev/null
  source "$git_completion"
fi
