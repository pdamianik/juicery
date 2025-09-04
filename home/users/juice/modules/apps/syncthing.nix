{ username, lib, host, ... }:
let
  devices = lib.filterAttrs (name: _: name != host) {
    "orange-juice" = {
      id = "RNHN35U-EPUJTA2-QLACF5Z-SWSRJ37-5M7YXFB-UA6D2QL-5A7ASRO-PCKGTQQ";
    };
    "blueberry-juice" = {
      id = "X4QJTRO-LUOGJBL-G4QJVIU-EDMKR6Y-GFE6C2U-CPUSNRL-PWQRXKQ-YVTACQV";
    };
  };
  deviceNames = lib.attrsets.mapAttrsToList (name: _value: name) devices;
in
{
  services.syncthing.settings = {
    inherit devices;
    folders = {
      "TGM" = {
        path = "/home/${username}/Documents/TGM";
        devices = deviceNames;
        ignorePerms = false;
      };
      "private" = {
        path = "/home/${username}/Documents/private";
        devices = deviceNames;
        ignorePerms = false;
      };
      "business" = {
        path = "/home/${username}/Documents/business";
        devices = deviceNames;
        ignorePerms = false;
      };
      "TU" = {
        path = "/home/${username}/Documents/TU";
        devices = deviceNames;
        ignorePerms = false;
      };
      "Videos" = {
        path = "/home/${username}/Videos";
        devices = deviceNames;
        ignorePerms = false;
      };
      "Music" = {
        path = "/home/${username}/Music";
        devices = deviceNames;
        ignorePerms = false;
      };
      "Pictures" = {
        path = "/home/${username}/Pictures";
        devices = deviceNames;
        ignorePerms = false;
      };
    };
  };
}
