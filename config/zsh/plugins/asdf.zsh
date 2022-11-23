source $ASDF_DATA_DIR/asdf.sh
fpath=(${ASDF_DATA_DIR}/completions $fpath)
autoload -Uz compinit && compinit

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
