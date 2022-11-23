path=(
    /home/linuxbrew/.linuxbrew/bin(N-/)
    /opt/homebrew/bin(N-/)
    "$HOME/.local/bin"(N-/)
    "$XDG_CONFIG_HOME/scripts/bin"(N-/)
    "$path[@]"
)

eval "$(sheldon source)"
eval "$(starship init zsh)"
