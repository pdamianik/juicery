{ pkgs, ... }:
{
  services.pcscd.enable = true;
  services.udev.packages = with pkgs; [ yubikey-personalization ];
  environment.systemPackages = with pkgs; [ age-plugin-yubikey age rage sops ];
  services.yubikey-agent.enable = true;
}
