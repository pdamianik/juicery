{ pkgs, ... }:
{
  home.packages = with pkgs; [
    minesweep-rs
    gnome-mines
  ];
}
