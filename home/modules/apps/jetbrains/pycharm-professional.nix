{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ pycharm-professional ];
in
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
