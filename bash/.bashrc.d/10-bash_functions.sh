#!/usr/bin/env bash

# My project switcher with tab completion
function c() { cd "$HOME/code/$1" || return; }
function _c() {
	IFS=$'\n' tmp=($(compgen -W "$(ls --color=never "$HOME/code")" -- "${COMP_WORDS[$COMP_CWORD]}"))
	COMPREPLY=( "${tmp[@]// /\ }" )
}
complete -o default -F _c c

# My project switcher for work project with tab completion
function cw() { cd "$HOME/code/work/$1" || return; }
function _cw() {
	IFS=$'\n' tmp=($(compgen -W "$(ls --color=never "$HOME/code/work/")" -- "${COMP_WORDS[$COMP_CWORD]}"))
	COMPREPLY=( "${tmp[@]// /\ }" )
}
complete -o default -F _cw cw

# SSH Profile Manager
#
# I prefer to use separate SSH configurations for various reasons (such as
# separate SSH keys for work and personal usage). Using meta-programming
# techniques for creating bash functions like ssh, sshw, etc., allows me to
# dynamically generate SSH functions based on different config files found in the
# ~/.ssh directory. For each config file in the ~/.ssh directory, a function is
# created with a suffix derived from the config file's name. For example, if the
# config file is named 'config-work', a function `sshw` will be created where 'w'
# stands for work.
#
# It offers the following features:
#  - A warning before connecting to a production server.
#  - Auto-completion for hosts from each SSH config
#  - Separate ssh, scp, and sftp functions for each SSH config
while read -r config; do
  prefix=$(basename $config | cut -sd'-' -f2 | cut -c1-1)

source /dev/stdin <<FUNC
  function ssh$prefix() {
    if [[ \$1 == *"prod"* ]]; then
      echo -e "\e[1;41mYou're about to connect to PRODUCTION server. BE CAREFUL!\e[0m";
      read -p "Press enter to continue..."
    fi

    /usr/bin/ssh -F "$config" "\$@"
  }

  function _ssh$prefix() {
    IFS=\$'\n' tmp=(\$(compgen -W "\$(grep "^Host" $config | grep -v "[?*]" | cut -d" " -f2-)" -- "\${COMP_WORDS[\$COMP_CWORD]}"))
    COMPREPLY=( "\${tmp[@]// /\ }" )
  }
FUNC

alias scp$prefix="scp -F $config"
alias sftp$prefix="sftp -F $config"

complete -o "default" \
         -o "nospace" \
         -F _ssh$prefix \
         scp$prefix ssh$prefix sftp$prefix
done < <(find "${HOME}/.ssh/" -name "config*")
unset prefix
