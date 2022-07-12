#!/usr/bin/env bash

sudo add-apt-repository -y ppa:mmstick76/alacritty

sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    git \
    wget \
    cmake \
    fzf \
    zsh \
    unzip \
    zip \
    fontconfig \
    alacritty \
    neovim
