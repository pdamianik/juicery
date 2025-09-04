{ pkgs, ... }:
{
  home.packages = with pkgs; [
    protontricks
    protonup-ng
  ];
}
