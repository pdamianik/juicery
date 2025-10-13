{ config, username, ... }:
{
  programs.gpg.publicKeys = [
    # {
    #   source = config.sops.secrets."users/${username}/gpg-key".path;
    #   trust = "ultimate";
    # }
  ];
}
