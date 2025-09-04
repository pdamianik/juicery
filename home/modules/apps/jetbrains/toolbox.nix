{ pkgs, ... }:
let
  packages = with pkgs; [ jetbrains-toolbox ];
in
{
  home.packages = packages;

  # programs.jetbrains-remote.ides = packages;
}
