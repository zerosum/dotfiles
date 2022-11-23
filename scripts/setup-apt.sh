#!/usr/bin/env bash

[ "$(uname)" = "Darwin" ] && exit

sudo add-apt-repository -y ppa:kelleyk/emacs

sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    build-essential \
    git \
    curl \
    fontconfig \
    emacs28
