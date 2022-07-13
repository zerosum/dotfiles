#!/usr/bin/env bash

[ "$(uname)" = "Darwin" ] && exit

sudo add-apt-repository -y ppa:mmstick76/alacritty

sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    git \
    curl \
    wget \
    cmake \
    fzf \
    zsh \
    unzip \
    zip \
    fontconfig \
    neovim
    # alacritty \
