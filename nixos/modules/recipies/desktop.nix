{
  imports = [
    ../nixpkgs/unfree.nix
    ../kernel/zen.nix
    ../boot/silent.nix
    ../boot/plymouth
    ../desktop/audio/pipewire.nix
    ../flatpak/default.nix
    ../dconf.nix
    ../apps/droidcam.nix
  ];
}
