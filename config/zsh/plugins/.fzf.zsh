fzf_dir=''
case $OSTYPE in
    darwin*)
    fzf_dir=/opt/homebrew/opt/fzf
    ;;
    *)
    fzf_dir=$XDG_DATA_HOME/fzf
    ;;
esac

# Setup fzf
# ---------
if [[ ! "$PATH" == *$fzf_dir/bin* ]]; then
  PATH="${PATH:+${PATH}:}$fzf_dir/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$fzf_dir/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$fzf_dir/shell/key-bindings.zsh"

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
