let
  username = "juice";
  userSecret = { sopsFile = ./secrets.yml; };
in
{
  sops.age.keyFile = "/var/lib/sops-nix/keys.txt";
  sops.secrets."users/${username}/password" = userSecret // {
    neededForUsers = true;
  };
}

