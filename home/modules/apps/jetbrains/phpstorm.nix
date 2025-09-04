{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ phpstorm ];
in 
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
