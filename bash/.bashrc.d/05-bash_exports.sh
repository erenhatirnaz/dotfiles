#!/usr/bin/env bash

# Make emacs the default editor.
export EDITOR='emacsclient -c';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
# Add date time info to history file
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# Set term style
export TERM="xterm-256color"

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Fix GTK3+ scolling issue stumpwm
export GDK_CORE_DEVICE_EVENTS=1

# Set rust cargo directory
export CARGO_HOME=${HOME}/.cargo

# Set java directory
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Set GNU readline inputrc path
export INPUTRC="${HOME}/.bashrc.d/15-inputrc.conf"

# My scripts
export PATH=${PATH}:${HOME}/bin

# Add 3th party tools to PATH variable
export PATH=${PATH}:${HOME}/.local/bin
export PATH=${PATH}:${HOME}/.npm/bin
export PATH=${PATH}:${HOME}/.yarn/bin
export PATH=${PATH}:${HOME}/.cask/bin
export PATH=${PATH}:${HOME}/.cargo/bin
export PATH=${PATH}:${HOME}/.rvm/bin
export PATH=${PATH}:${HOME}/.nimble/bin
export PATH=${PATH}:${HOME}/.config/composer/vendor/bin
export PATH=${PATH}:${HOME}/.fzf/bin
export PATH=${PATH}:${HOME}/go/bin
export PATH=${PATH}:${HOME}/.local/share/gem/ruby/3.0.0/bin
