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
prompt_style() {
  if [ -n "$BASH_VERSION" ]; then
    printf '\[%s%s\]' "$RESET" "$1"
  else
    printf '%%{%s%s%%}' "$RESET" "$1"
  fi
}

# Show the commit status of the current git repo
git_repo_state() {
  local git_status
  git_status="$(git status 2>/dev/null | tail -n1)"

  [[ $git_status != *"nothing to commit"* ]] && printf '%s' "[!]"
}

# Show the name and status of the current git repo
prompt_git() {
  local flags git_status output
  git_status="$(git status 2>/dev/null)" || return

  output="$(printf '%s\n' "$git_status" | awk '/# Initial commit/ {print "(init)"}')"
  [[ "$output" ]] || output="$(printf '%s\n' "$git_status" | awk '/# On branch/ {print $4}')"
  [[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"

  flags="$(
    printf '%s\n' "$git_status" | awk 'BEGIN {r=""} \
      /^# Changes to be committed:$/        {r=r "+"}\
      /^# Changes not staged for commit:$/  {r=r "!"}\
      /^# Untracked files:$/                {r=r "?"}\
      END {print r}'
  )"

  if [[ "$flags" ]]; then
    output="${output}[$flags]"
  fi

  printf '%s' "$(prompt_style "$SOLAR_WHITE") on $(prompt_style "$SOLAR_CYAN")${output}$(git_repo_state)"
}

# Build the prompt string for the given shell
#
# @param $1 The shell name
build_prompt() {
  local branch host newline path prefix prompt user

  case "$1" in
    bash)
      branch='\$(prompt_git)'
      host='\h'
      newline='\n'
      path='\w'
      prefix='\$'
      user='\u'
      ;;
    zsh)
      branch='$(prompt_git)'
      host='%m'
      newline=$'\n'
      path='%~'
      prefix='%#'
      user='%n'
      ;;
  esac

  prompt=$newline
  prompt+="$(prompt_style "$SOLAR_ORANGE")${user}$(prompt_style "$SOLAR_WHITE")@$(prompt_style "$SOLAR_YELLOW")${host}"
  prompt+="$(prompt_style "$SOLAR_WHITE"): $(prompt_style "$SOLAR_GREEN")${path}"
  prompt+="${branch}"
  prompt+=$newline
  prompt+="$(prompt_style "$SOLAR_WHITE")${prefix} $(prompt_style)"

  printf '%s' "$prompt"
}

if [ -n "$BASH_VERSION" ]; then
  PS1="$(build_prompt bash)"
elif [ -n "$ZSH_VERSION" ]; then
  setopt prompt_subst
  # shellcheck disable=SC2034
  PROMPT="$(build_prompt zsh)"
fi
