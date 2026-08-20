# Solarized colors
# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
BOLD=$(tput bold)
RESET=$(tput sgr0)
SOLAR_YELLOW=$(tput setaf 136)
SOLAR_ORANGE=$(tput setaf 166)
SOLAR_BLUE=$(tput setaf 33)
SOLAR_CYAN=$(tput setaf 37)
SOLAR_GREEN=$(tput setaf 64)
SOLAR_WHITE=$(tput setaf 254)

# Prompt styles
style_user="%{${RESET}${SOLAR_ORANGE}%}"
style_host="%{${RESET}${SOLAR_YELLOW}%}"
style_path="%{${RESET}${SOLAR_GREEN}%}"
style_chars="%{${RESET}${SOLAR_WHITE}%}"
style_important="%{${RESET}${BOLD}${SOLAR_BLUE}%}"
style_branch="%{${SOLAR_CYAN}%}"
style_reset="%{${RESET}%}"

# Show the commit status of the current git repo
function git_repo_state() {
  local git_status
  git_status="$(git status 2>/dev/null | tail -n1)"
  [[ $git_status != *"nothing to commit"* ]] && print -n "[!]"
}

# Show the name and status of the current git repo
function prompt_git() {
  local git_status output flags
  git_status="$(git status 2>/dev/null)"
  [[ $? != 0 ]] && return

  output="$(echo "$git_status" | awk '/# Initial commit/ {print "(init)"}')"
  [[ "$output" ]] || output="$(echo "$git_status" | awk '/# On branch/ {print $4}')"
  [[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"

  flags="$(
    echo "$git_status" | awk 'BEGIN {r=""} \
      /^# Changes to be committed:$/        {r=r "+"}\
      /^# Changes not staged for commit:$/  {r=r "!"}\
      /^# Untracked files:$/                {r=r "?"}\
      END {print r}'
  )"

  if [[ "$flags" ]]; then
    output="${output}[$flags]"
  fi
  print -n "${style_chars} on ${style_branch}${output}$(git_repo_state)"
}

# Build the prompt
setopt prompt_subst
PROMPT=$'\n'
if [[ -n "$SSH_TTY" ]]; then
  PROMPT+="${style_important}[SSH] "
fi
PROMPT+="${style_user}%n${style_chars}@${style_host}%m"
PROMPT+="${style_chars}: ${style_path}%~"
if [[ -z "$SSH_TTY" ]]; then
  PROMPT+='$(prompt_git)'
fi
PROMPT+=$'\n'
PROMPT+="${style_chars}%# ${style_reset}"
