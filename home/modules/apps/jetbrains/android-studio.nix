{ pkgs, ... }:
let
  packages = with pkgs; [
    android-studio
    android-studio-tools
  ];
in
{
  home.packages = packages;

  # programs.jetbrains-remote.ides = packages;
}
