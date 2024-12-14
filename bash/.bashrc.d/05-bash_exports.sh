#!/usr/bin/env bash

# XDG Defaults
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Create directories for states
STATE_DIRS=("bash" "node" "less" "mysql")
for DIRECTORY in "${STATE_DIRS[@]}"; do
  mkdir -p "${XDG_STATE_HOME}/${DIRECTORY}";
done
unset STATE_DIRS DIRECTORY

# Make emacs the default editor.
export EDITOR='emacsclient -c';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
# Add date time info to history file
export HISTTIMEFORMAT="%h %d %H:%M:%S "
# Change Bash history file path
export HISTFILE="${XDG_STATE_HOME}/bash/history"

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node/history";
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE="${HISTSIZE}";
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Set term style
export TERM="xterm-256color"

# Set Less history file path
export LESSHISTFILE="${XDG_STATE_HOME}/less/history"

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Fix GTK3+ scolling issue stumpwm
export GDK_CORE_DEVICE_EVENTS=1

# Set rust cargo directory
export CARGO_HOME=${HOME}/.cargo

# Set java directory
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
if [[ "$OSTYPE" =~ "darwin"* ]]; then
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
fi

# Set history file path for mysql
export MYSQL_HISTFILE="${XDG_STATE_HOME}/mysql/history"

# Set GNU readline inputrc path
export INPUTRC="${HOME}/.bashrc.d/15-inputrc.conf"

# Global PATH variables
export PATH=${PATH}:${HOME}/.local/bin

# PATH variable for GNU/Linux
if [[ "${OSTYPE}" =~ "linux-gnu" ]]; then
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
fi

# PATH variable for MacOS
if [[ "$OSTYPE" =~ "darwin"* ]]; then
  export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}
  export PATH=/opt/homebrew/opt/findutils/libexec/gnubin:${PATH}
  export PATH=/opt/homebrew/opt/gnu-indent/libexec/gnubin:${PATH}
  export PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:${PATH}
  export PATH=/opt/homebrew/opt/gnu-tar/libexec/gnubin:${PATH}
  export PATH=/opt/homebrew/opt/grep/libexec/gnubin:${PATH}
  export PATH=/opt/homebrew/opt/gawk/libexec/gnubin:${PATH}
  export PATH=/opt/homebrew/bin:${PATH}
fi
