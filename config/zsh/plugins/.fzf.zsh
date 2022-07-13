# Setup fzf
# ---------
if [[ ! "$PATH" == *$XDG_DATA_HOME/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$XDG_DATA_HOME/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$XDG_DATA_HOME/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$XDG_DATA_HOME/fzf/shell/key-bindings.zsh"

frepo() {
    local dir
    dir=$(ghq list | fzf-tmux)
    if [ -n "$dir" ]; then
        BUFFER="cd $(ghq root)/$dir"
        zle accept-line
    fi
    zle reset-prompt
}
zle -N frepo
bindkey '^]' frepo

# common setting
export FZF_DEFAULT_OPTS='--height 20% --reverse --border --prompt="? "'
export FZF_ALT_C_OPTS="--select-1 --exit-0"
