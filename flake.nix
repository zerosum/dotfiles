{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
  };

  outputs = { nixpkgs, ... }: {
    homeManagerModules = {
      base = import ./home/default.nix;
      git = import ./module/git;
      zsh = import ./module/zsh;
      alacritty = import ./module/alacritty;
      tmux = import ./module/tmux;
    };
  };
}
