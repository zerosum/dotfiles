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

fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
