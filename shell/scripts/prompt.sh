# shellcheck shell=bash disable=SC2016

RESET=$(tput sgr0)
SOLAR_CYAN=$(tput setaf 37)
SOLAR_GREEN=$(tput setaf 64)
SOLAR_ORANGE=$(tput setaf 166)
SOLAR_WHITE=$(tput setaf 254)
SOLAR_YELLOW=$(tput setaf 136)

# Wrap control sequences to prevent parsing as prompt text
#
# @param $1 The style to wrap
jlocsei_style() {
  if [ -n "$BASH_VERSION" ]; then
    printf '\[%s%s\]' "$RESET" "$1"
  else
    printf '%%{%s%s%%}' "$RESET" "$1"
  fi
}

# Show the name and status of the current git repo
jlocsei_git_repo() {
  local branch git_status

  branch="$(git branch --show-current 2>/dev/null)" || return
  [ -n "$branch" ] || return

  git_status="$(git status --porcelain 2>/dev/null)"
  [ -n "$git_status" ] && git_status="[!]"

  printf '%s' "$(jlocsei_style "$SOLAR_WHITE") on $(jlocsei_style "$SOLAR_CYAN")$branch$git_status"
}

# Build the prompt string for the given shell
#
# @param $1 The shell name
build_prompt() {
  local branch host newline path prefix prompt user

  case "$1" in
    bash)
      branch='\$(jlocsei_git_repo)'
      host='\h'
      newline='\n'
      path='\w'
      prefix='\$'
      user='\u'
      ;;
    zsh)
      branch='$(jlocsei_git_repo)'
      host='%m'
      newline=$'\n'
      path='%~'
      prefix='%#'
      user='%n'
      ;;
  esac

  prompt=$newline
  prompt+="$(jlocsei_style "$SOLAR_ORANGE")$user$(jlocsei_style "$SOLAR_WHITE")@$(jlocsei_style "$SOLAR_YELLOW")$host"
  prompt+="$(jlocsei_style "$SOLAR_WHITE"): $(jlocsei_style "$SOLAR_GREEN")$path"
  prompt+="$branch"
  prompt+=$newline
  prompt+="$(jlocsei_style "$SOLAR_WHITE")$prefix $(jlocsei_style)"

  printf '%s' "$prompt"
}

if [ -n "$BASH_VERSION" ]; then
  PS1="$(build_prompt bash)"
elif [ -n "$ZSH_VERSION" ]; then
  setopt prompt_subst
  # shellcheck disable=SC2034
  PROMPT="$(build_prompt zsh)"
fi

unset -f build_prompt
