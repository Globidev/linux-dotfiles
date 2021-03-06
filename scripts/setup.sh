#!/usr/bin/env bash

set -eu
source $DOT/scripts/lib/log.sh
source $DOT/scripts/lib/install.sh

step() {
    printf "\n"
    colored 190 "$1"
}

step "Setting up your dotfiles..."

step "Updating package list..."
apt-get update -qq

for dir in $DOT/{tools,tmux,oh-my-zsh,docker,atom,sublime-text} ; do
    step "Seting up $(basename $dir)..."
    install_component $dir
done
