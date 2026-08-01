# ホストの結線を 1 箇所に閉じ込める。
#
# home.username / home.homeDirectory はここでも各ホストでも設定しない。
# home-manager の nixos/common.nix が config.users.users.<name>.{name,home}
# から通常優先度で設定するため、重ねて書くと定義衝突になる。
# darwin 側は nix-darwin が users.users.<name>.home を持たないので、
# ここで name と home の両方を宣言してやる必要がある。
# NixOS 側は isNormalUser 等が users.users.<name>.name を mkDefault より
# 高い優先度で既に設定しているため name は不要だが、home だけは
# isNormalUser が mkDefault で /home/<name> を入れているに過ぎず、
# username が "zerosum" 以外だと NixOS 標準のデフォルト /var/empty に
# 落ちてしまう。そのため home のみを通常優先度で宣言し、mkDefault を
# 上書きする形にする。
{ modulesPath, systemPath }:
{
  mkDarwinHost =
    { inputs
    , system
    , hostPath
    , username ? "zerosum"
    , overlays ? [ ]
    , extraSpecialArgs ? { }
    , extraModules ? [ ]
    }:
    inputs.darwin.lib.darwinSystem {
      inherit system;
      modules = [
        (systemPath + "/darwin")
        { nixpkgs.overlays = overlays; }
        {
          users.users.${username} = {
            name = username;
            home = "/Users/${username}";
          };
        }
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-bak";
          home-manager.extraSpecialArgs = inputs // extraSpecialArgs;
          home-manager.users.${username}.imports = [ modulesPath hostPath ];
        }
      ] ++ extraModules;
    };

  mkNixosHost =
    { inputs
    , system
    , hostPath
    , username ? "zerosum"
    , overlays ? [ ]
    , extraSpecialArgs ? { }
    , extraModules ? [ ]
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        (systemPath + "/nixos")
        { nixpkgs.overlays = overlays; }
        {
          users.users.${username}.home = "/home/${username}";
        }
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-bak";
          home-manager.extraSpecialArgs = inputs // extraSpecialArgs;
          home-manager.users.${username}.imports = [ modulesPath hostPath ];
        }
      ] ++ extraModules;
    };
}
