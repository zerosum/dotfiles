path=(
  "$HOME/.cargo/bin"(N-/)
  "$HOME/.local/bin"(N-/)
  "$HOME/.fzf/bin"(N-/)
  "$path[@]"
)

eval "$(sheldon source)"
eval "$(starship init zsh)"
