export PATH="/usr/local/sbin:/usr/local/bin:~/Developer/bin:~/Developer/bin/cc0/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib

alias profile="mkdir -p logs; iprofiler -leaks -d logs"
alias smlnj="rlwrap sml" # command history in smlnj

# Initialize `fuck` command which easily fixes command typos by typing "fuck" (lol)
eval $(thefuck --alias)

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}

emojis=("👻" "💩" "👽" "🤑" "💪" "👌" "👉" "♋️" "🙃" "🌚" "💦" "😜" "🐶" "✨" "💯" "🍆")

RANDOM=$$$(date +%s)
selectedemoji=${emojis[$RANDOM % ${#emojis[@]}]}

# https://wiki.bash-hackers.org/scripting/terminalcodes
bold=$(tput bold)
cyan=$(tput setaf 6)
left=$(tput cub1)      # backspace, used to fix emoji width
spos=$(tput sc)        # save position, used to fix emoji width
lpos=$(tput rc)        # load position, used to fix emoji width
reset=$(tput sgr0)
white=$(tput setaf 7)
dim='\033[2m'          # for some reason $(tput dim) doesn't work
dark_blue='\e[94m'     # not sure how to do this with tput
yellow=$(tput setaf 3)


dt=$(date '+%d/%m/%Y %H:%M:%S');
echo -e "${bold}Hello, ${cyan}$USER${white}!${reset}  This session's emoji is: $selectedemoji"
echo -e "   ${dim}Session Timestamp: $dt\n--------------------------------------------------\n${reset}"

export PS1="\[${dark_blue}\]\W \[${yellow}\]\$(parse_git_branch)\[${reset}\]  \[${spos}${left}${left}${selectedemoji}${lpos}\] \[${reset}\]"
