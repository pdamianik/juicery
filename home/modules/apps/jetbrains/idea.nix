{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ idea ];
in 
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
