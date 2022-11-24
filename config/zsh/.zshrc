path=(
    /home/linuxbrew/.linuxbrew/bin(N-/)
    /opt/homebrew/bin(N-/)
    "$HOME/.local/bin"(N-/)
    "$XDG_CONFIG_HOME/scripts/bin"(N-/)
    "$path[@]"
)

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

eval "$(sheldon source)"
eval "$(starship init zsh)"
