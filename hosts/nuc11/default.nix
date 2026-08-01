{ pkgs, ... }:

{
    my.identity = {
      name = "TAKAHASHI Osamu";
      email = "345161+zerosum@users.noreply.github.com";
    };

    home.packages = with pkgs; [
      coursier
    ];

    home.sessionPath = [
      "$HOME/.bin"
      "$HOME/.local/share/coursier/bin"
    ];

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
}
