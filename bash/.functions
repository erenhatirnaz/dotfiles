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

# SSH and SCP for work servers
# * Use seperate ssh config file for work servers
# * Pre-warning when connecting to production environment
# * Tab completion for SSH Hostnames
function sshw() {
	if [[ $1 == *"prod"* ]]; then
		echo -e "\e[1;41mYou're connecting to PRODUCTION server. BE CAREFUL!\e[0m";
    read -p "Press enter to continue..."
	fi

	ssh -F ~/.ssh/config-work "$@"
}
function _sshw() {
	IFS=$'\n' tmp=($(compgen -W "$(grep "^Host" ~/.ssh/config-work | grep -v "[?*]" | cut -d" " -f2-)" -- "${COMP_WORDS[$COMP_CWORD]}"))
	COMPREPLY=( "${tmp[@]// /\ }" )
}
complete -o default -F _sshw sshw

function scpw() {
  scp -F ~/.ssh/config-work "$@"
}
# TODO: Filename compilation not works when copying from host to remote
function _scpw() {
	IFS=$'\n' tmp=($(compgen -W "$(grep "^Host" ~/.ssh/config-work | grep -v "[?*]" | awk '{print $2":"}')" -- "${COMP_WORDS[$COMP_CWORD]}"))
	COMPREPLY=( "${tmp[@]}" )
}
complete -o nospace -F _scpw scpw
