#!/bin/bash

if [[ $(ls $HOME/.cargo/bin/rustup) ]]; then
rustup update
else
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi
$HOME/.cargo/bin/cargo install wasm-pack

