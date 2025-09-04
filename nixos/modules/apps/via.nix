{ pkgs, ... }:
{
  services.udev.packages = with pkgs; [ via ];
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [
    via
    vial
  ];
}
