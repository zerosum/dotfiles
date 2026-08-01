{ pkgs, ... }:

{
    my.identity = {
      name = "TAKAHASHI Osamu";
      email = "345161+zerosum@users.noreply.github.com";
    };

    home.packages = with pkgs; [
      gh
    ];

    home.sessionPath = [
      "/Applications/IntelliJ IDEA.app/Contents/MacOS"
      "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    ];
}
