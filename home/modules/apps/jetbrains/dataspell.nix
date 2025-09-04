{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ dataspell ];
in
{
  home.packages = packages;
  
  programs.jetbrains-remote.ides = packages;
}
