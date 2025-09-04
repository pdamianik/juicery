{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ idea-ultimate ];
in 
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
