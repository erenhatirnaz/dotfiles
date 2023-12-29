#!/usr/bin/env bash



prompt_git() {
	local s=''
	local branchName=''

	# Check if the current directory is in a Git repository.
	if [ "$(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}")" == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null

			# Check for uncommitted changes in the index.
			if ! git diff --quiet --ignore-submodules --cached; then
				s+='+'
			fi

			# Check for unstaged changes.
			if ! git diff-files --quiet --ignore-submodules --; then
				s+='!'
			fi

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?'
			fi

			# Check for stashed files.
			if git rev-parse --verify refs/stash &>/dev/null; then
				s+='$'
			fi
		fi

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')"

		[[ -n "${s}" ]] && s=" [${s}]"

		echo -e "${1}${branchName}${2}${s}"
	else
		return
	fi
}

if [[ ! "$TERM" = "eterm-color"  ]] && tput setaf 1 &>/dev/null; then
	tput sgr0 # reset colors
	bold=$(tput bold)
	reset=$(tput sgr0)
	black=$(tput setaf 0)
	blue=$(tput setaf 4)
	cyan=$(tput setaf 6)
	green=$(tput setaf 2)
	orange=$(tput setaf 208)
	purple=$(tput setaf 5)
	red=$(tput setaf 1)
	violet=$(tput setaf 5)
	white=$(tput setaf 15)
	yellow=$(tput setaf 3)
else
	bold=''
	reset="\\e[0m"
	black="\\e[1;30m"
	blue="\\e[1;34m"
	cyan="\\e[1;36m"
	green="\\e[1;32m"
	orange="\\e[1;33m"
	purple="\\e[1;35m"
	red="\\e[1;31m"
	violet="\\e[1;35m"
	white="\\e[1;37m"
	yellow="\\e[1;33m"
fi

# User style
userStyle="${orange}"

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}"
else
	hostStyle="${yellow}"
fi

# Set the terminal title and prompt.
if [[ "$COLORTERM" == "truecolor" || "$COLORTERM" == "rxvt-xpm" ]]; then
	PS1="\\W"
	PS1="\\[\\033]0;\\W\\007\\]" # working directory base name
 else
   PS1=""
 fi

PS1+="\\[${bold}\\]" # bold
PS1+="\\[${userStyle}\\]\\342\\224\\214\\342\\224\\200 " # pipe
PS1+="\\[${userStyle}\\]\\u" # username
# PS1+="\[${white}\] at " # at
# PS1+="\[${hostStyle}\]\h" # host
PS1+="\\[${white}\\] in " # in
PS1+="\\[${green}\\]\\w" # working directory full path
PS1+="\$(prompt_git \"\\[${white}\\] on \\[${violet}\\]\" \"\\[${blue}\\]\")" # git repository details
PS1+="\\n" # new line

PS1+="\\[${bold}\\]" # bold
PS1+="\\[${userStyle}\\]\\342\\224\\224\\342\\224\\200\\342\\224\\200\\342\\225\\274 \\[${reset}\\]" # pipe
PS1+="$ \\[${reset}\\]" # `$` (and reset color)
export PS1;

PS2="\\[${yellow}\\]→ \\[${reset}\\]"
export PS2
