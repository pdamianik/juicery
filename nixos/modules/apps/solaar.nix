{ inputs, pkgs, ... }:
{
  imports = [
    inputs.solaar.nixosModules.default
  ];
  services.solaar.enable = true;
  services.ratbagd.enable = true;

  environment.systemPackages = with pkgs; [ piper ];
}
