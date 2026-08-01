{ ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  nix.settings.trusted-users = [ "zerosum" ];

  time.timeZone = "Asia/Tokyo";

  system.stateVersion = 5;
}
