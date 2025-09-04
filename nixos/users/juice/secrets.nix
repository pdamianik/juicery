{ ... }:
let
  username = "juice";
  userSecret = { sopsFile = ./secrets.yml; };
in
{
  sops.age.keyFile = "../../../keys/age.txt";
  sops.secrets."users.${username}.password" = userSecret // {
    neededForUsers = true;
  };
}

