{ username, pkgs, ... }:
{
  imports = [
    ../../users/${username}/modules/apps/gpg.nix
  ];
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableFishIntegration = true;
    pinentry = {
      package = pkgs.pinentry-gnome3;
    };
  };
}
