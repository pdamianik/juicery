{ pkgs, ... }:
{
  home.packages = with pkgs; [ curtail ];
}
