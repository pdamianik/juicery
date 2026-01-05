{ pkgs, ... }:
let
  packages = with pkgs.jetbrains; [ pycharm ];
in
{
  home.packages = packages;

  programs.jetbrains-remote.ides = packages;
}
