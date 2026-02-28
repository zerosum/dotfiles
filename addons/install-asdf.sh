#! /usr/bin/env nix-shell
#! nix-shell -i zsh -p git

ASDF_ROOT="$HOME/.asdf"

if [ ! -e "$ASDF_ROOT" ]; then
  git clone https://github.com/asdf-vm/asdf.git $ASDF_ROOT --branch v0.14.0
fi
