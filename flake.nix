{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";

    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... }@inputs:
    let
      lib = import ./lib { root = ./.; };
    in
    {
      inherit lib;

      homeModules.default = ./modules;
      darwinModules.default = ./system/darwin;
      nixosModules.default = ./system/nixos;

      darwinConfigurations.mbp14 = lib.mkDarwinHost {
        inherit inputs;
        system = "aarch64-darwin";
        hostPath = ./hosts/mbp14;
      };

      nixosConfigurations.nuc11 = lib.mkNixosHost {
        inherit inputs;
        system = "x86_64-linux";
        hostPath = ./hosts/nuc11;
      };
    };
}
