ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

path=(
    /opt/homebrew/bin(N-/)
    "$HOME/.local/bin"(N-/)
    "$XDG_CONFIG_HOME/scripts/bin"(N-/)
    "$XDG_DATA_HOME/cargo/bin"(N-/)
    "$path[@]"
)

zinit wait lucid blockf light-mode for \
    @'zsh-users/zsh-autosuggestions' \
    @'zsh-users/zsh-completions' \
    @'zdharma-continuum/fast-syntax-highlighting'

zinit wait lucid for \
    PZTM::environment \
    PZTM::terminal \
    PZTM::history \
    PZTM::utility

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

source "$ZDOTDIR/plugins/.fzf.zsh"

export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
source $ASDF_DATA_DIR/asdf.sh
fpath=(${ASDF_DATA_DIR}/completions $fpath)
autoload -Uz compinit && compinit

export CARGO_HOME="$XDG_DATA_HOME"/cargo

eval "$(navi widget zsh)"

zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir)($| )" ]]
}
