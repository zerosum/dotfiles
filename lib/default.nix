# root は flake のソースルート。lib/ が modules/ と system/ の場所を
# 知る必要があるため、呼び出し側から渡してもらう。
{ root }:
{
  mkLocalOverlay = import ./mkLocalOverlay.nix;
}
// import ./mkHost.nix {
  modulesPath = root + "/modules";
  systemPath = root + "/system";
}
