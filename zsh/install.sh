# shellcheck shell=bash

LOADER="$(child_path shell/scripts/source.sh)"

PROFILE="$HOME/.zshrc"
touch "$PROFILE"

SOURCE_LINE="source $LOADER"

if ! grep -Fqx "$SOURCE_LINE" "$PROFILE"; then
  perform_action "Sourcing shell loader in zsh profile"
  echo "$SOURCE_LINE" >> "$PROFILE"
else
  skip_action "Already sourcing shell loader in zsh profile"
fi
