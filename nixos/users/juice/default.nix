{ config, ... }:
let
  username = "juice";
in
{
  imports = [
    ./secrets.nix
    ./home-manager.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] ++ (if config.programs.wireshark.enable then [ "wireshark" ] else []);
    hashedPasswordFile = config.sops.secrets."users.${username}.password".path;
  };
}
