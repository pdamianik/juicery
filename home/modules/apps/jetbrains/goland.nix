{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ goland ];
in
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
