{
  pkgs,
  ...
}:

{
  environment.systemPackages = [ pkgs.lact ];
  systemd.packages = [ pkgs.lact ];

  services.lact.enable = true;
}
