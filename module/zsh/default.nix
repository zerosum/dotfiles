{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    shellAliases = {
        ll = "ls -alF";
        g = "frepo";
    };
    initContent = ''
    frepo() {
        local dir
        dir=$(ghq list | fzf-tmux)
        if [ -n "$dir" ]; then
            if [[ -n "$ZLE_LINE_ABORTED" ]]; then
                BUFFER="cd $(ghq root)/$dir"
                zle accept-line
            else
                cd "$(ghq root)/$dir"
            fi
        fi
        if [[ -n "$ZLE_LINE_ABORTED" ]]; then
            zle reset-prompt
        fi
    }
    zle -N frepo
    bindkey '^]' frepo
    '';
  };
}