
# Solarized colors
# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
BOLD=$(tput bold)
RESET=$(tput sgr0)
SOLAR_YELLOW=$(tput setaf 136)
SOLAR_ORANGE=$(tput setaf 166)
SOLAR_RED=$(tput setaf 124)
SOLAR_MAGENTA=$(tput setaf 125)
SOLAR_VIOLET=$(tput setaf 61)
SOLAR_BLUE=$(tput setaf 33)
SOLAR_CYAN=$(tput setaf 37)
SOLAR_GREEN=$(tput setaf 64)
SOLAR_WHITE=$(tput setaf 254)

# Prompt styles
style_user="\[${RESET}${SOLAR_ORANGE}\]"
style_host="\[${RESET}${SOLAR_YELLOW}\]"
style_path="\[${RESET}${SOLAR_GREEN}\]"
style_chars="\[${RESET}${SOLAR_WHITE}\]"
style_branch="${SOLAR_CYAN}"

# Git status
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
 echo -ne "${SOLAR_WHITE} on ${style_branch}${output}"
}

# Build the prompt
PS1="\n" # Newline
PS1+="${style_user}\u" # Username
PS1+="${style_chars}@" # @
PS1+="${style_host}\h" # Host
PS1+="${style_chars}: " # :
PS1+="${style_path}\w" # Working directory
PS1+="\$(prompt_git)" # Git details
PS1+="\n" # Newline
PS1+="${style_chars}\$ \[${RESET}\]" # $ (and reset color)

