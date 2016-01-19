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
style_user="\[${RESET}${SOLAR_ORANGE}\]"
style_host="\[${RESET}${SOLAR_YELLOW}\]"
style_path="\[${RESET}${SOLAR_GREEN}\]"
style_chars="\[${RESET}${SOLAR_WHITE}\]"
style_important="\[${RESET}${BOLD}${SOLAR_BLUE}\]"
style_branch="${SOLAR_CYAN}"
style_virtualenv="${BOLD}${SOLAR_ORANGE}"

# Show the commit status of the current git repo
function git_repo_state() {
  local status
  status="$(git status 2>/dev/null | tail -n1)"
  [[ $status != *"nothing to commit"* ]] && echo "[!]";
}

# Show the name and status of the current git repo
function prompt_git() {
  local status output flags
  status="$(git status 2>/dev/null)"
  [[ $? != 0 ]] && return;

  output="$(echo "$status" | awk '/# Initial commit/ {print "(init)"}')"
  [[ "$output" ]] || output="$(echo "$status" | awk '/# On branch/ {print $4}')"
  [[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"

  flags="$(
  echo "$status" | awk 'BEGIN {r=""} \
    /^# Changes to be committed:$/        {r=r "+"}\
    /^# Changes not staged for commit:$/  {r=r "!"}\
    /^# Untracked files:$/                {r=r "?"}\
    END {print r}'
  )"

  if [[ "$flags" ]]; then
    output="$output[$flags]"
  fi
  echo -ne "${SOLAR_WHITE} on ${style_branch}${output}$(git_repo_state)"
}

# Show the name of the current virtualenv
function prompt_virtualenv() {
  local env_name
  env_name=`basename "$VIRTUAL_ENV"`

  if [[ -n "$env_name" ]]; then
    echo -ne " ${style_virtualenv}[env/${env_name}]"
  fi
}

# Build the prompt
PS1="\n"
if [[ "$SSH_TTY" ]]; then
  PS1+="${style_important}[SSH] " # [SSH]
fi
PS1+="${style_user}\u${style_chars}@${style_host}\h" # username@host
PS1+="${style_chars}: ${style_path}\w" # : directory
if [[ -z "$SSH_TTY" ]]; then
  PS1+="\$(prompt_git)" # Git details
  PS1+="\$(prompt_virtualenv)" # Virtualenv details
fi
PS1+="\n"
PS1+="${style_chars}\$ \[${RESET}\]"
