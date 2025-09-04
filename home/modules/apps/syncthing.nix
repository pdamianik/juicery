{ username, host, ... }:
{
  imports = [
    ../../users/${username}/hosts/${host}/modules/apps/syncthing.nix
    ../../users/${username}/modules/apps/syncthing.nix
  ];

  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
    tray.enable = true;
  };
}
