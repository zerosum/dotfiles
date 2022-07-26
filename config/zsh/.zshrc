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

### starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

###
source "$ZDOTDIR/plugins/.fzf.zsh"
[[ -e "$ZDOTDIR/plugins/.local.zsh" ]] &&  source "$ZDOTDIR/plugins/.local.zsh"

###
source $ASDF_DATA_DIR/asdf.sh
fpath=(${ASDF_DATA_DIR}/completions $fpath)
autoload -Uz compinit && compinit

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

### navi
export NAVI_PATH="$XDG_DATA_HOME/navi/cheats:`navi info cheats-path`"
eval "$(navi widget zsh)"

### Haskell
[ -f "$XDG_DATA_HOME/ghcup/env" ] && source $XDG_DATA_HOME/ghcup/env

###
zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir|fg)($| )" ]]
}

### aliases
alias scheme='docker run -it --rm -w /root/work z3r05um/mit-scheme:11.2'
alias em='emacs -nw'
