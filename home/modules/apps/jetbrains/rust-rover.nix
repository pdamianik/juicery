{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ rust-rover ];
in 
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
