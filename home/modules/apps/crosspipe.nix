{ pkgs, ... }:
{
  home.packages = with pkgs; [ crosspipe ];
}
