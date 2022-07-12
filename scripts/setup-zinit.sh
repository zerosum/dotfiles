#! /usr/bin/env zsh

source "$(dirname "$0")/common.sh"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ -d $ZINIT_HOME ]]; then
    source "${ZINIT_HOME}/zinit.zsh"
    zinit self-update
    zinit update --parallel
else
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
