{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    mouse = true;
    baseIndex = 1;
    historyLimit = 10000;
    escapeTime = 0;
    keyMode = "vi";
    terminal = "tmux-256color";

    extraConfig = ''
      # True color support
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Pane splitting (keep current directory)
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Pane navigation (vim-style)
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Pane resizing
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # New window with current directory
      bind c new-window -c "#{pane_current_path}"

      # Status bar - Solarized Dark
      set -g status-style "bg=#073642,fg=#839496"
      set -g status-left "#[fg=#268bd2,bold] #S "
      set -g status-right "#[fg=#586e75]#h | %Y-%m-%d %H:%M "
      set -g status-left-length 20
      set -g status-right-length 40

      # Window status
      set -g window-status-format " #I:#W "
      set -g window-status-current-format "#[fg=#fdf6e3,bg=#268bd2,bold] #I:#W "

      # Pane border
      set -g pane-border-style "fg=#073642"
      set -g pane-active-border-style "fg=#268bd2"

      # Dim inactive panes
      set -g window-style "bg=#0a3f4e"
      set -g window-active-style "bg=#002b36"

      # Copy mode (macOS pbcopy integration)
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
    '';
  };
}
