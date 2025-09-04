let
  users = builtins.attrNames (builtins.readDir ./users);
in
{
  imports = [
    ./hardware
    ../../modules/recipies/core.nix
    ../../modules/recipies/system.nix
    ../../modules/recipies/desktop.nix
    ../../modules/recipies/printing.nix
    ../../modules/recipies/gaming.nix
    ../../modules/desktop/gnome
  ] ++ map (username: ./users/${username}) users;

  system.stateVersion = "25.05";
}
