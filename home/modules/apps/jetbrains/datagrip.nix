{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ datagrip ];
in
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
