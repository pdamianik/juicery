{ username, host, ... }:
{
  sops = {
    age.keyFile = "../../../keys/age.txt";
    defaultSopsFile = ./secrets.yml;
    secrets = {
      "users.${username}.gpg-key" = {};
      "hosts.${host}.syncthing.key" = {};
      "hosts.${host}.syncthing.cert" = {};
      "hosts.${host}.syncthing.id" = {};
    };
  };
}

