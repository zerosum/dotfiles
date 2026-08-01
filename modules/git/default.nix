{ config, lib, ... }:

let
  identity = config.my.identity;
  extras = config.my.git.extraIdentities;
in
{
    options.my.git.extraIdentities = lib.mkOption {
      default = [ ];
      description = "gitdir に応じて既定の人格を上書きするルール";
      type = lib.types.listOf (lib.types.submodule {
        options = {
          gitdir = lib.mkOption {
            type = lib.types.str;
            description = "includeIf の gitdir 条件 (例: ~/gitrepos/github.com/foo/)";
          };
          email = lib.mkOption {
            type = lib.types.str;
            description = "この gitdir 配下で使うメールアドレス";
          };
          name = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
            description = "氏名も変える場合に指定する。null なら既定の人格の氏名を使う";
          };
        };
      });
    };

    config.programs.git = {
      enable = true;

      settings = {
        core = {
          editor = "nvim";
        };
        ghq = {
          root = "~/gitrepos";
        };
      };

      includes =
        [ { contents.user = { inherit (identity) name email; }; } ]
        ++ map
          (i: {
            condition = "gitdir:${i.gitdir}";
            contents.user = { inherit (i) email; }
              // lib.optionalAttrs (i.name != null) { inherit (i) name; };
          })
          extras;

      ignores = [
        ".idea/"
        "*.iml"
        ".vscode/"
        ".tool-versions"
        ".metals/"
        ".bloop"
        "metals.sbt"
        ".tours/"
        "*.code-workspace"
        ".DS_Store"
        ".claude/"
      ];
    };
}
