{ pkgs, ... }:

{
    home.packages = with pkgs; [
      ghq
      jq
      fzf
      navi
      httpie
    ];

    home.file.".config/navi/config.yaml".text = ''
    cheats:
      paths:
        - ~/.local/share/navi/cheats
        - ~/.config/navi/cheats
    '';

    home.file.".config/ghostty/config".text = ''
      font-family = "HackGen Console NF"
      font-size = 15
      theme = "Solarized Dark - Patched"
    '';

    programs = {
      starship.enable = true;

      neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
      };

      jq.enable = true;
      fzf.enable = true;
      navi.enable = true;
    };
}
