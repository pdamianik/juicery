{ config, host, ... }:
{
  services.syncthing.key = config.sops.secrets."hosts/${host}/syncthing/key".path;
  services.syncthing.cert = config.sops.secrets."hosts/${host}/syncthing/cert".path;

  systemd.user.services.syncthing = {
    Unit =
    let
      deps = [
        "sops-nix.service"
      ];
    in
    {
      Wants = deps;
      After = deps;
    };
  };
}
