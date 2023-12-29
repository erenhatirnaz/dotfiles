#!/usr/bin/env bash

# run startx when startup
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx -- -ardelay 300 -arinterval 30; fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Load the shell dotfiles
while read -r f; do source "$f"; done < <(find "${HOME}/.bashrc.d/" -name "*.sh" | sort)

# Load dircolors
if [[ -r ~/.dircolors ]] && type -p dircolors >/dev/null; then
  eval $(dircolors -b "$HOME/.dircolors")
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done
unset option

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && \
  complete -o "default"\
           -o "nospace"\
           -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d" " -f2- | tr ' ' '\n')"\
           scp sftp ssh

# Use GPG as ssh-agent
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
