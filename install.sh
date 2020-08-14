#!/bin/bash
set -e

script=$(basename "$0")

if ! which stow 1>/dev/null; then
	echo "${script}: stow is now exists."
	exit 1
fi

stow -t ~ stow
stow -t ~ bash
stow -t ~ bin
stow -t ~ emacs
stow -t ~ fonts
stow -t ~ fun
stow -t ~ git
stow -t ~ pass
stow -t ~ X

echo "${script}: all dotfiles installed."
