source $ASDF_DATA_DIR/asdf.sh
fpath=(${ASDF_DATA_DIR}/completions $fpath)
autoload -Uz compinit && compinit
