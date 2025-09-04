{ pkgs, ... }:
{
  home.packages = with pkgs; [
    flightgear
    simgear
  ];
}
