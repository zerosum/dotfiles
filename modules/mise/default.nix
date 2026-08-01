{ ... }:

{
    # ランタイムのバージョンは Nix 管理外。globalConfig / settings を
    # 書くと ~/.config/mise/ 配下が read-only symlink になり、
    # mise use -g / mise settings set が失敗する。
    programs.mise = {
      enable = true;
      enableZshIntegration = true;
    };
}
