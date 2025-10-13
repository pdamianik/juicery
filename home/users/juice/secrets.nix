{ username, host, pkgs, ... }:
{
  home.file.".config/sops/age/keys.txt" = {
    source = ../../../keys/juice.txt;
    # text = "${builtins.readFile ../../../keys/user.txt}\n${builtins.readFile ../../../keys/system.txt}";
  };
  sops = {
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yml;
    secrets = {
      "users/${username}/gpg-key" = {};
      "hosts/${host}/syncthing/key" = {};
      "hosts/${host}/syncthing/cert" = {};
    };
  };
  systemd.user.services.sops-nix.Service.ExecStartPre = "${pkgs.coreutils}/bin/sleep 10";
  # NOTE: not working as intended; this ideally should make the line above obsolete
  # systemd.user.services.sops-nix.Unit.Requires = [
  #   "graphical-session.target"
  #   # "gpg-agent.socket"
  #   "pcscd.socket"
  # ];
  # systemd.user.services.sops-nix.Unit.After = [
  #   "graphical-session.target"
  #   # "gpg-agent.socket"
  #   "pcscd.socket"
  # ];
}

