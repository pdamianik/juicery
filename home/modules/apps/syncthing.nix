{ username, ... }:
{
  imports = [
    ../../users/${username}/modules/apps/syncthing.nix
  ];

  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
    tray.enable = true;
  };
}
