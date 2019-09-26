### functions for fzf

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
