{ lib, ... }:

{
    # 「コミットの著者として名乗る人格」。OS アカウント (home.username) とは
    # 別レイヤ。default を置かないことで、未設定のまま switch が通る事故を
    # 評価時に止める。
    options.my.identity = {
      name = lib.mkOption {
        type = lib.types.str;
        description = "コミットの author として使う氏名";
      };

      email = lib.mkOption {
        type = lib.types.str;
        description = "コミットの author として使う既定のメールアドレス";
      };
    };
}
