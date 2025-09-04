{
  pkgs,
  ...
}:

{
  environment.systemPackages = [ pkgs.lact ];
  systemd.packages = [ pkgs.lact ];

  systemd.services.lactd = {
    description = "LACT GPU Control Daemon";
    wantedBy = [ "multi-user.target" ];
  };
  # TODO: replace with in 25.11
  # services.lact.enable = true;
}
