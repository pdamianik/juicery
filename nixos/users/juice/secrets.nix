{ ... }:
let
  username = "juice";
  userSecret = { sopsFile = ./secrets.yml; };
in
{
  sops.age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
  sops.secrets."users/${username}/password" = userSecret // {
    neededForUsers = true;
  };
}

