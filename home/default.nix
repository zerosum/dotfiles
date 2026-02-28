{ config, pkgs, ... }:

{
    imports = [
      ../module/git
      ../module/zsh
      ../module/alacritty
    ];

    home.packages = with pkgs; [
      neofetch

      ghq
      jq
      fzf
      navi
      httpie
      tmux
    ];

    home.file.".config/ghostty/config".text = ''
      font-family = "HackGen Console NF"
      font-size = 15
      theme = "Solarized Dark - Patched" 
    '';

    home.file.".config/navi/config.yaml".text = ''
    cheats:
      paths:
        - ~/.local/share/navi/cheats
        - ~/.config/navi/cheats
    '';

    programs = {
      zsh = {
        enable = true;
      };

      starship = {
        enable = true;
      };

      neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
      };

      git = {
        enable = true;
      };

      jq = {
        enable = true;
      };

      fzf = {
        enable = true;
      };

      navi = {
        enable = true;
      };

      home-manager.enable = true;
    };

    home.stateVersion = "25.11";
}
