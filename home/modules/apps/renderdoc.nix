{ pkgs, ... }:
{
  home.packages = with pkgs; [ renderdoc ];
}

