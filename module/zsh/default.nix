{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    sessionVariables = {
      LANG = "ja_JP.UTF-8";
    };

    shellAliases = {
        ll = "ls -alF";
        g = "frepo";
    };

    # Cache compinit - only regenerate if dump is older than 24h
    completionInit = ''
      autoload -Uz compinit
      if [[ -n ''${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
        compinit
      else
        compinit -C
      fi
    '';

    initContent = lib.mkOrder 1100 ''
      # Auto-start tmux with session picker
      if [[ -z "$TMUX" && $- == *i* ]]; then
        _tmux_sessions=$(tmux ls -F '#{session_name}' 2>/dev/null)
        if [[ -n "$_tmux_sessions" ]]; then
          _choice=$(echo "$_tmux_sessions\n[new session]" | fzf --prompt="tmux session> " --height=~10)
          if [[ "$_choice" == "[new session]" ]]; then
            exec tmux new-session
          elif [[ -n "$_choice" ]]; then
            exec tmux attach -t "$_choice"
          fi
        else
          exec tmux new-session
        fi
        unset _tmux_sessions _choice
      fi

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