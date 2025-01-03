#!/usr/bin/env bash

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Paper shredder
alias rmrf="rm -rf"

# Directory bookmarks
alias dl="cd ${HOME}/Downloads"
alias dt="cd ${HOME}/Desktop"
alias dm="cd ${HOME}/Documents"
alias msc="cd ${HOME}/Music && cmus"

# List all files colorized in long format
alias ll="ls -lF --color --group-directories-first"

# List all files colorized in long format, including dotfiles
alias la="ls -laF --color --group-directories-first"

# List only directories
alias lsd="ls -ld */"
alias lsda="ls -laF --color=never | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls --color --group-directories-first"

# Always enable colored `grep` output
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Print calendar numbers
alias week="date +%V"
alias month="date '+%m %B'"
alias monthe="LC_ALL=en_US.utf-8 date '+%m %B'"
alias dayofyear="date +%j"
alias dayofmonth="date +%d"
alias dayofweek="date '+%u %A'"

# just alias for date command
alias now="date"

# add given duration to now
# depends: dateutils - http://www.fresse.org/dateutils/
alias now+="dateadd $(date +'%Y-%m-%d')"

alias datediff="datediff --format=\"%Y years %m months %d days %H hours %M minutes %S seconds\""

# A basic stop watch
alias stopwatch="time read -N 1"

# Print IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Show local IP addresses (IPv4 and IPv6)
alias lip="nmcli -p device show | grep -i IP4.ADDRESS | head -n1 | cut -d: -f2 | xargs"
if [[ "$OSTYPE" =~ "darwin"* ]]; then
  alias lip="ipconfig getifaddr en0"
fi

# List all open network ports
alias openports4="lsof -Pi4TCP -sTCP:LISTEN"
alias openports6="lsof -Pi6TCP -sTCP:LISTEN"

# Empty the Trash
# TODO: move this alias to function
TRASH_DIR="${HOME}/.local/share/Trash/*"
if [[ "$OSTYPE" =~ "darwin"* ]]; then
  TRASH_DIR="${HOME}/.Trash/*"
fi

alias emptytrash="rm -rf ${TRASH_DIR}"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path="echo -e \"$(echo $PATH | sed 's/:/\\n/g')\""

# Convert clipboard content to QRCode
# TODO: convert this to toolbox script
# alias clip2qr="xclip -out -selection clipboard | qrencode -o - -t UTF8"

# Copy & Paste
alias copy="xclip -selection clipboard"
if [[ "$OSTYPE" =~ "darwin"* ]]; then
  alias copy="pbcopy"
fi

# List all fonts
alias fontlist="fc-list | cut -d: -f2 | sort -u | uniq"

# Clear swap partition
alias clearswap="sudo swapoff -a && sudo swapon -a"

# Clear memory caches
alias clearcache="sudo sysctl vm.drop_caches=1 && sudo sysctl vm.drop_caches=2 && sudo sysctl vm.drop_caches=3"

# Combination of clear swap and clear cache
alias clearsc="clearswap && clearcache"

# `free` with human readable format and gigabyte unit
alias free="free --giga --human"

# Shutdown PC
alias bye="shutdown -h now"

# Disable&Enable Notifications
alias disable_notify='notify-send "DUNST_COMMAND_PAUSE"'
alias enable_notify='notify-send "DUNST_COMMAND_RESUME"'

# My tools
alias mkcd=". mkcd"
alias clonecd=". clonecd"

# jobs always shows PID
alias jobs="jobs -l"

# Password generator
alias genpass="cat /dev/urandom | tr -dc 'a-zA-Z0-9-!@#$%&*()_+~' | fold -w 15 | head -n 1"

# Restart pulseaudio
alias restpulse="pulseaudio -k && pulseaudio --start"

# Colored neofetch
alias neofetch="neofetch --ascii_colors 3 3 3 3 3 3 --colors 3 2 2 2 3 15"

# Copy pwd
alias cpwd='pwd | tr -d "\n" | copy'

# List all installed and upgraded packages
alias paclogi='paclog | grep -E "installed|upgraded"'

# Print system infos
alias tlp-stat='sudo tlp-stat'

# Print all windows
alias ls-win='xwininfo -tree -root'

# Find keycode utility
alias xfindkey='xev -event keyboard'

# List all keys on keyboard
alias xlskey='xmodmap -pke'

# Ghost cursor
alias hide-cursor='tput civis'

# Magit
alias magit="emacs --eval \"(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)\" -f magit-status"

# Play test sound
alias audiotest="mpv ~/Music/notification/cheerful.ogg"

# PHP setup
alias php8="/usr/bin/php80"

alias composer8="COMPOSER_MEMORY_LIMIT=-1 /usr/bin/php80 /usr/bin/composer"
alias composer81="COMPOSER_MEMORY_LIMIT=-1 /usr/bin/php81 /usr/bin/composer"

alias artisan8="php8 artisan"
alias artisan81="php81 artisan"

alias open_last_migration="ls -td $PWD/database/migrations/* --color=never | head -n1 | xargs codium"
alias remove_last_migration="ls -td $PWD/database/migrations/* --color=never | head -n1 | xargs rm"
