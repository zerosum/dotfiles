let
  mkLocalOverlay = import ../lib/mkLocalOverlay.nix;

  # callPackage を差し替えた偽の final。nixpkgs を評価せずに済ませる。
  fakeFinal = {
    callPackage = path: _args: import path { marker = "ok"; };
  };

  result = mkLocalOverlay ./fixtures/pkgs fakeFinal { };
in
assert builtins.attrNames result == [ "dummy" ];
assert result.dummy == "ok";
"PASS"
