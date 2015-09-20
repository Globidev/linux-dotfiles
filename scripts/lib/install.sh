#! /usr/bin/env bash

set -eu
shopt -s nullglob
shopt -s dotglob
source $DOT/scripts/lib/log.sh

apt_get() {
    sudo apt-get install -yqq $@
}

install_component() {
    local dir=$1

    for file in $dir/*.install.apt ; do
        local name=$(basename $file)
        info "installing ${name%.install.apt}..."
        apt_get $(cat $file)
    done

    for file in $dir/*.install.custom ; do
        local name=$(basename $file)
        info "installing ${name%.install.custom}..."
        $file
    done

    for file in $dir/*.symlink ; do
        local name=$(basename $file)
        local target=${name%.symlink}
        info "Symlinking $target in $HOME"
        ln -sf $file $HOME/$target
    done
}
