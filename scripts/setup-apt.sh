#!/usr/bin/env bash

[ "$(uname)" = "Darwin" ] && exit

sudo add-apt-repository -y ppa:mmstick76/alacritty
sudo add-apt-repository -y ppa:kelleyk/emacs

sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    git \
    curl \
    wget \
    cmake \
    zsh \
    unzip \
    zip \
    fontconfig \
    neovim \
    emacs28
    # alacritty \
