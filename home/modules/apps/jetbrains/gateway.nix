{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ gateway ];
in
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
