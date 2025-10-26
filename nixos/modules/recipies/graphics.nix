{ pkgs, ... }:
let
  xp-pen-01-v3 = pkgs.callPackage ../../../pkgs/xp-pen-01-v3/package.nix {};
in
{
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  environment.systemPackages = [ xp-pen-01-v3 ];
}
