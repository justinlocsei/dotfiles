# shellcheck shell=bash

if [[ "$(defaults read -g ApplePressAndHoldEnabled)" == "0" ]]; then
  skip_action "Press and hold is already disabled"
else
  perform_action "Disable press and hold"
  defaults write -g ApplePressAndHoldEnabled -bool false
fi
