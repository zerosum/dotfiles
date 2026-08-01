# pkgs/<name>/default.nix を pkgs.<name> として公開する overlay を作る。
#
#   nixpkgs.overlays = [ (mkLocalOverlay ./pkgs) ];
#
# final.callPackage を使うため、自前パッケージ同士が互いを参照できる。
dir: final: _prev:
let
  entries = builtins.readDir dir;
  pkgNames = builtins.filter (n: entries.${n} == "directory") (builtins.attrNames entries);
in
builtins.listToAttrs (map
  (n: {
    name = n;
    value = final.callPackage (dir + "/${n}") { };
  })
  pkgNames)
