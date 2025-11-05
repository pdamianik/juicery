{ username, ... }:
{
  imports = [
    ../wayland
    ../../../users/${username}/modules/desktop/gnome/theme.nix
    ../../../users/${username}/modules/desktop/gnome/extensions.nix
    ../../../users/${username}/modules/desktop/gnome/tweaks.nix
    ./gnome-tweaks.nix
    ./gnome-extension-manager.nix
  ];
}
