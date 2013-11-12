#!/bin/sh

PROFILE="$HOME/.bash_profile"

for script in aliases.sh env.sh prompt.sh; do
  source_line="source $PWD/$script"
  if [ -z "`grep "$source_line" "$PROFILE"`" ]; then
    echo "Sourcing $script in bash profile"
    echo "$source_line" >> "$PROFILE"
  else
    echo "Already sourcing $script in bash profile"
  fi
done

. "$PROFILE"
