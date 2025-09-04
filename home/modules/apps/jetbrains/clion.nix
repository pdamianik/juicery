{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ clion ];
in
{
  home.packages = packages;
  programs.jetbrains-remote.ides = packages;
}
