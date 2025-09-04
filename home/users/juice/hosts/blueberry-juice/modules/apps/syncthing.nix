{ config, host, ... }:
{
  services.syncthing.key = config.sops.secrets."hosts/${host}/syncthing/key".path;
  services.syncthing.cert = config.sops.secrets."hosts/${host}/syncthing/cert".path;
}
