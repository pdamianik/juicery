{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ jdk ];
in
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
