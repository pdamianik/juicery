{ username, host, ... }:
{
  sops = {
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yml;
    secrets = {
      "users/${username}/gpg-key" = {};
      "hosts/${host}/syncthing/key" = {};
      "hosts/${host}/syncthing/cert" = {};
      "hosts/${host}/syncthing/id" = {};
    };
  };
}

