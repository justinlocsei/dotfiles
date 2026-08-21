# shellcheck shell=bash

LOADER="$(child_path shell/scripts/source.sh)"

PROFILE="$HOME/.bash_profile"
touch "$PROFILE"

SOURCE_LINE="source $LOADER"

if ! grep -Fqx "$SOURCE_LINE" "$PROFILE"; then
  perform_action "Sourcing shell loader in bash profile"
  echo "$SOURCE_LINE" >> "$PROFILE"
else
  skip_action "Already sourcing shell loader in bash profile"
fi
