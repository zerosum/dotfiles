{ config, pkgs, lib, ... }:

{
    programs.git = {
      settings = {
        core = {
          editor = "nvim";
        };
        ghq = {
          root = "~/gitrepos";
        };
      };

      includes = [
        {
          contents = {
            user = {
              name = "TAKAHASHI Osamu";
              email = "345161+zerosum@users.noreply.github.com";
            };
          };
        }
      ];

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