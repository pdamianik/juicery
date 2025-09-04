{ host, inputs, pkgs-unstable, system, ... }:
let
  username = "juice";
in 
{
  home-manager.extraSpecialArgs = { inherit inputs host username pkgs-unstable system; };
  home-manager.users.${username} = {
    # _module.args = { inherit username; };
    imports = [
      ../../../home/users/${username}/default.nix
      ../../../home/users/${username}/hosts/${host}/default.nix
    ];

    home.username = username;
    home.homeDirectory = "/home/${username}";
  };
}
