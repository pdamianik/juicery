{ pkgs, ... }:
{
  home.packages = with pkgs; [ winetricks ];
}
