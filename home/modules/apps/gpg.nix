{ username, ... }:
{
  imports = [
    ../../users/${username}/modules/apps/gpg.nix
  ];
  programs.gpg.enable = true;
  services.gpg-agent.enable = true;
  services.gpg-agent.enableSshSupport = true;
}
