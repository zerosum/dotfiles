# Setup fzf
# ---------
if [[ ! "$PATH" == *$BREW_HOME/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$BREW_HOME/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$BREW_HOME/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$BREW_HOME/opt/fzf/shell/key-bindings.zsh"

# common setting
export FZF_DEFAULT_OPTS='--height 20% --reverse --border --prompt="? "'
export FZF_ALT_C_OPTS="--select-1 --exit-0"
