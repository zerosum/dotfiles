{ ... }:

{
    imports = [
      ./identity
      ./cli
      ./git
      ./zsh
      ./tmux
      ./mise
      ./alacritty
    ];

    programs.home-manager.enable = true;

    home.stateVersion = "25.11";
}
