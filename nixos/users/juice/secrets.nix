{ pkgs, lib, ... }:
let
  username = "juice";
  userSecret = { sopsFile = ./secrets.yml; };
in
{
  sops.age.keyFile = "/var/lib/sops-nix/keys.txt";
  sops.secrets."users/${username}/password" = userSecret // {
    neededForUsers = true;
  };

  system.activationScripts.setupYubikeyForSopsNix.text = ''
    PATH=$PATH:${lib.makeBinPath [ pkgs.age-plugin-yubikey ] }
    ${pkgs.runtimeShell} -c "mkdir -p /var/lib/pcsc && ln -sfn ${pkgs.ccid}/pcsc/drivers /var/lib/pcsc/drivers"
    ${pkgs.toybox}/bin/pgrep pcscd > /dev/null && ${pkgs.toybox}/bin/pkill pcscd
    ${pkgs.pcsclite}/bin/pcscd
  '';
  system.activationScripts.setupSecretsForUsers.deps = [ "setupYubikeyForSopsNix" ];
}

