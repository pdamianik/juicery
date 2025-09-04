{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-remote-desktop
  ];

  services.gnome.gnome-remote-desktop.enable = true;
  services.xrdp.openFirewall = true;
  networking.firewall.allowedTCPPorts = [ 3389 ];
  networking.firewall.allowedUDPPorts = [ 3389 ];
}
